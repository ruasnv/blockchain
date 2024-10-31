const User = require('../models/User');

// Register a new user
exports.registerUser = async (req, res) => {
  try {
    const { walletAddress } = req.body;
    let user = await User.findOne({ walletAddress });
    if (!user) {
      user = new User({ walletAddress });
      await user.save();
    }
    res.status(201).json(user);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update user reputation
exports.updateReputation = async (req, res) => {
  try {
    const { walletAddress, reputationChange } = req.body;
    const user = await User.findOneAndUpdate(
      { walletAddress },
      { $inc: { reputation: reputationChange } },
      { new: true }
    );
    res.status(200).json(user);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
