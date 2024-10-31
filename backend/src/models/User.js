const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
  walletAddress: { type: String, required: true, unique: true },
  reputation: { type: Number, default: 0 },
  completedJobs: { type: Number, default: 0 }
});

module.exports = mongoose.model('User', UserSchema);
