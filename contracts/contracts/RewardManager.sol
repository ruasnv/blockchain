// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RewardManager {
    ERC20 public rewardToken;
    address public jobSubmissionAddress;

    constructor(string memory name, string memory symbol, address _jobSubmissionAddress) {
        rewardToken = new ERC20(name, symbol);
        jobSubmissionAddress = _jobSubmissionAddress;
    }

    function rewardResearcher(address researcher, uint256 amount) external {
        require(msg.sender == jobSubmissionAddress, "Only JobSubmission can reward");
        rewardToken.transfer(researcher, amount);
    }
}
