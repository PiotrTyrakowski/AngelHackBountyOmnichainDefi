import DynamicContractCaller from './DynamicContractCaller.js'
import {ethers} from "ethers";

export async function RunDynamicContractMethod(contractAddress, contractAbi, method, jsonArgNames, jsonArgTypes, jsonArgValues) {
    let zetaNetwork
    let contractCaller

    try{
        kwargs = listsToJson(jsonArgNames, jsonArgTypes, jsonArgValues);
    } catch(error) {
        console.log(`Error occured during converting json lists pf strings into kwargs json: ${error}`);
        return `Failed: ${error}`;
    }

    try {
        zetaNetwork = new ethers.Network("https://zeta-chain-testnet.drpc.org", 7001);
    } catch (error) {
        console.log(`Error occurred during network constructor: ${error}`);
        return `Failed: ${error}`;
    }

    try {
        contractCaller = new DynamicContractCaller(zetaNetwork, contractAddress, contractAbi);
    } catch (error) {
        console.log(`Error occurred during contract constructor: ${error}`);
        return `Failed: ${error}`;
    }

    return await contractCaller.init().then(async (caller) => {
        return await caller.runContractMethod(method, kwargs);
    }).catch((error) => {
        console.log(`During contract execution error occurred: ${error}`);
        return `Failed: ${error}`;
    })
}

function listsToJson(argNames, argTypes, argValues) {
    if (argNames.length !== argTypes.length || argTypes.length !== argValues.length) {
        throw new Error("All input lists must have the same length");
    }

    const result = {};

    for (let i = 0; i < argNames.length; i++) {
        const name = argNames[i];
        const type = argTypes[i].toLowerCase();
        let value = argValues[i];

        // Convert value based on type
        switch (type) {
            case "address":
                if (ethers.utils.isAddress(value)) {
                    value = ethers.utils.getAddress(value); // Checksum address
                } else {
                    throw new Error(`Invalid Ethereum address for argument: ${name}`);
                }
                break;
            case "uint256":
            case "int256":
                try {
                    value = ethers.BigNumber.from(value).toString();
                } catch (e) {
                    throw new Error(`Invalid ${type} for argument: ${name}`);
                }
                break;
            case "bool":
                value = value.toLowerCase() === "true";
                break;
            case "bytes32":
                if (ethers.utils.isHexString(value) && value.length === 66) {
                    value = ethers.utils.hexZeroPad(value, 32);
                } else {
                    throw new Error(`Invalid bytes32 for argument: ${name}`);
                }
                break;
            case "string":
                // Keep as is, will be JSON stringified later
                break;
            default:
                // For arrays and other complex types, try to parse as JSON
                try {
                    value = JSON.parse(value);
                } catch (e) {
                    // If parsing fails, keep it as a string
                }
        }

        result[name] = value;
    }

    return JSON.stringify(result, (key, value) => 
        typeof value === 'bigint' ? value.toString() : value
    , 2);
}