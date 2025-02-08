// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ITaskRegistry {
    enum TaskStatus { CREATED, ASSIGNED, COMPLETED, FAILED }

    struct TaskData {
        uint256 id;
        string prompt;
        address issuer;
        TaskStatus status;
        address assignee;
        uint256 proposalId;
    }

    struct Proposal {
      address issuer;
      string serviceName;
      uint256 price;
      uint256 proposalId;
  }

    event TaskCreated(address indexed issuer, address indexed assignee, uint256 taskId, uint256 proposalId, string prompt);
    event TaskStatusChanged(uint256 indexed taskId, TaskStatus status);
    event TaskAssigned(uint256 indexed taskId, address indexed agent);
    event ProposalApproved(uint256 indexed taskId, Proposal proposal);
    event TaskCompleted(uint256 indexed taskId, string result);

    function createTask(string memory prompt, uint256 proposalId) external payable returns (TaskData memory);
    function completeTask(uint256 taskId, string memory result) external;
    function getTasksByIssuer(address issuer) external view returns (uint256[] memory);
    function getTask(uint256 taskId) external view returns (TaskData memory);
    function getStatus(uint256 taskId) external view returns (TaskStatus);
    function getAssignee(uint256 taskId) external view returns (address);
}
