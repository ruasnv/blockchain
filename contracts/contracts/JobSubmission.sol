// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JobSubmission {
    struct Job {
        uint256 jobId;
        address researcher;
        uint256 reward;
        uint256 requiredGPU;
        uint256 requiredCPU;
        uint256 expectedRuntime;
        string details;
        string dockerImageHash;
        address contributor;
        bool isCompleted;
    }

    mapping(uint256 => Job) public jobs;
    uint256 public nextJobId;

    event JobSubmitted(uint256 jobId, address researcher, uint256 reward, uint256 requiredGPU, uint256 requiredCPU, uint256 expectedRuntime, string details, string dockerImageHash);
    event JobCompleted(uint256 jobId, address contributor);

    function submitJob(
        uint256 reward,
        uint256 requiredGPU,
        uint256 requiredCPU,
        uint256 expectedRuntime,
        string memory details,
        string memory dockerImageHash
    ) external {
        jobs[nextJobId] = Job({
            jobId: nextJobId,
            researcher: msg.sender,
            reward: reward,
            requiredGPU: requiredGPU,
            requiredCPU: requiredCPU,
            expectedRuntime: expectedRuntime,
            details: details,
            dockerImageHash: dockerImageHash,
            contributor: address(0),
            isCompleted: false
        });

        emit JobSubmitted(nextJobId, msg.sender, reward, requiredGPU, requiredCPU, expectedRuntime, details, dockerImageHash);
        nextJobId++;
    }

    function completeJob(uint256 jobId, address contributor) external {
        require(jobs[jobId].researcher == msg.sender, "Only the researcher can mark job as complete");
        require(!jobs[jobId].isCompleted, "Job is already completed");

        jobs[jobId].contributor = contributor;
        jobs[jobId].isCompleted = true;

        emit JobCompleted(jobId, contributor);
    }

    function getJob(uint256 jobId) external view returns (Job memory) {
        return jobs[jobId];
    }
}
