const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
import dotenv from "dotenv";

dotenv.config();
// import AgentsRegistry from "./AgentsRegistry";

const EnsembleAvsLogicModule = buildModule("EnsembleAvsLogicModule", (m: any) => {

  // const { serviceRegistry, agentsRegistry } = m.useModule(AgentsRegistry);
  console.log(process.env.ATTESTATION_CENTER_ADRDRESS!);
  console.log(process.env.TASK_REGISTRY_ADDRESS!);
  const ensembleAvsLogic = m.contract("EnsembleAvsLogic", [process.env.ATTESTATION_CENTER_ADRDRESS!, process.env.TASK_REGISTRY_ADDRESS!]);

  return { ensembleAvsLogic, };
});

export default EnsembleAvsLogicModule; 