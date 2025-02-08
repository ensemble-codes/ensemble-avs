// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

interface IAttestationCenter {
    struct TaskInfo {
      string proofOfTask;
      bytes data;
      address taskPerformer;
      uint16 taskDefinitionId;
  }
}