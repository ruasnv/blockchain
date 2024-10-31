import Web3 from 'web3';

// Connect to MetaMask
const web3 = new Web3(Web3.givenProvider);

// Example of loading a contract
export const loadContract = async (contractAddress, abi) => {
    const contract = new web3.eth.Contract(abi, contractAddress);
    return contract;
};

export const getAccount = async () => {
    const accounts = await web3.eth.requestAccounts();
    return accounts[0];
};

// Define other contract interaction functions here...
