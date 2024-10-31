const mongoose = require('mongoose');

const JobSchema = new mongoose.Schema({
  title: { type: String, required: true },
  description: { type: String, required: true },
  creatorAddress: { type: String, required: true },
  status: { type: String, enum: ['pending', 'completed', 'in-progress'], default: 'pending' },
  reward: { type: Number, required: true },
  createdAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model('Job', JobSchema);
