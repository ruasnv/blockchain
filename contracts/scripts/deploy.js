const { ethers } = require("hardhat");

async function main() {
    // Deploy JobSubmission contract
    const JobSubmissionFactory = await ethers.getContractFactory("JobSubmission");
    const jobSubmission = await JobSubmissionFactory.deploy(); // Deploy the contract

    // Wait for the transaction to be mined
    await jobSubmission.deployTransaction.wait(); 
    console.log("JobSubmission deployed to:", jobSubmission.address); // Log the address

    // Deploy RewardManager contract
    const RewardManagerFactory = await ethers.getContractFactory("RewardManager");
    const rewardManager = await RewardManagerFactory.deploy("ResearchToken", "RTK", jobSubmission.address); // Use jobSubmission address if needed

    // Wait for the transaction to be mined
    await rewardManager.deployTransaction.wait(); 
    console.log("RewardManager deployed to:", rewardManager.address); // Log the address
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
