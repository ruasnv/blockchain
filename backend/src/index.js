// Import required libraries
const express = require('express');
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const Web3 = require('web3');
const IPFS = require('ipfs-http-client');

// Loads environment variables, provides acces to sensetive info without exposing it in code
dotenv.config();

// Initialize Express, used to manage HTTP endpoints
const app = express();
app.use(express.json());

// Set up Web3.js to connect to Ethereum (or any EVM-compatible blockchain)
// Web3 instance creation connects to blockchain provider (in our case INFURA)
const provider = new Web3.providers.HttpProvider(process.env.INFURA_URL); // Replace with your Infura URL
const web3 = new Web3(provider);

// Verify blockchain connection
web3.eth.net.isListening()
  .then(() => console.log("Connected to Ethereum network"))
  .catch(err => console.error("Blockchain connection error:", err));

// Set up IPFS client for file storage: Will store the docker images of submitted tasks
const ipfs = IPFS.create({ host: 'ipfs.infura.io', port: 5001, protocol: 'https' });

// A database framework, stores users tasks etc.
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('MongoDB connection error:', err));

// Import your smart contract ABI and set up a contract instance
const jobContractABI = require('./path-to-abi/JobSubmission.json'); // replace with your ABI file
const contractAddress = "0xYourContractAddressHere"; // replace with your contract address
const jobContract = new web3.eth.Contract(jobContractABI, contractAddress);

// Example API Endpoint: Submit a Job
app.post('/api/jobs', async (req, res) => {
  const { title, reward, description, walletAddress } = req.body;
  try {
    const transaction = await jobContract.methods.createJob(title, reward, description).send({
      from: walletAddress,
      gas: 3000000,
    });
    res.json({ status: 'Job created', transaction });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Example API Endpoint: Store Task in IPFS
app.post('/api/uploadTask', async (req, res) => {
  const { taskData } = req.body;
  try {
    const file = await ipfs.add(taskData);
    res.json({ cid: file.cid.toString() });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Starts the port for server to listen on (HTTP requests)
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
