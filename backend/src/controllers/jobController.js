const Job = require('../models/Job');

// Create a new job
exports.createJob = async (req, res) => {
  try {
    const { title, description, creatorAddress, reward } = req.body;
    const newJob = new Job({ title, description, creatorAddress, reward });
    await newJob.save();
    res.status(201).json(newJob);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Get all jobs
exports.getAllJobs = async (req, res) => {
  try {
    const jobs = await Job.find();
    res.status(200).json(jobs);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Update job status
exports.updateJobStatus = async (req, res) => {
  try {
    const { jobId, status } = req.body;
    const job = await Job.findByIdAndUpdate(jobId, { status }, { new: true });
    res.status(200).json(job);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
