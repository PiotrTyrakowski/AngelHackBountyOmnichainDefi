import DynamicContractCaller from './DynamicContractCaller.js'
import {ethers} from "ethers";

export async function RunDynamicContractMethod(contractAddress, contractAbi, method, kwargs) {
    let zetaNetwork
    let contractCaller

    try {
        zetaNetwork = new ethers.Network("https://zeta-chain-testnet.drpc.org", 7001);
    } catch (error) {
        console.log(`Error occurred during network constructor: ${error}`);
        return "FAIL";
    }

    try {
        contractCaller = new DynamicContractCaller(zetaNetwork, contractAddress, contractAbi);
    } catch (error) {
        console.log(`Error occurred during contract constructor: ${error}`);
        return "FAIL";
    }

    return await contractCaller.init().then(async (caller) => {
        return await caller.runContractMethod(method, kwargs);
    }).catch((error) => {
        console.log(`During contract execution error occurred: ${error}`);
        return "FAIL";
    })
}