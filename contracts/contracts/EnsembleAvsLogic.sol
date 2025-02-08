// SPDX-License-Identifier: MIT

pragma solidity >=0.8.20;

import "./interfaces/IAvsLogic.sol";
import "./interfaces/IAttestationCenter.sol";
import "./interfaces/ITaskRegistry.sol";


contract EnsembleAvsLogic {

  event TaskStatusChanged(uint256 indexed taskId, string result, bool isApproved);
  address public attestationCenter;
  address public taskRegistry;
  constructor(address _attestationCenter, address _taskRegistry) {
    attestationCenter = _attestationCenter;
    taskRegistry = _taskRegistry;
  }

  function afterTaskSubmission(IAttestationCenter.TaskInfo calldata _taskInfo, bool _isApproved, bytes calldata _tpSignature, uint256[2] calldata _taSignature, uint256[] calldata _attestersIds) external onlyAttestationCenter  {
    emit TaskStatusChanged(_taskInfo.taskDefinitionId, _taskInfo.proofOfTask, _isApproved);
    if (_isApproved) {
      ITaskRegistry(taskRegistry).completeTask(_taskInfo.taskDefinitionId, _taskInfo.proofOfTask);
    }
  }

  function beforeTaskSubmission(IAttestationCenter.TaskInfo calldata _taskInfo, bool _isApproved, bytes calldata _tpSignature, uint256[2] calldata _taSignature, uint256[] calldata _attestersIds) external onlyAttestationCenter {
    emit TaskStatusChanged(_taskInfo.taskDefinitionId, _taskInfo.proofOfTask, _isApproved);
  }

  modifier onlyAttestationCenter() {
    require(msg.sender == attestationCenter, "Only attestation center can call this function");
    _;
  }
}
