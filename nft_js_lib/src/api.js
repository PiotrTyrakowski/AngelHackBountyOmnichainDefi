import DynamicContractCaller from './DynamicContractCaller.js'
import {ethers} from "ethers";
import {validateAddress} from "./Utils.js";

export async function RunDynamicContractMethod(contractAddress, contractAbi, method, jsonArgNames, jsonArgTypes, jsonArgValues) {
    let zetaNetwork
    let contractCaller
    let kwargs

    try{
        kwargs = listsToJson(jsonArgNames, jsonArgTypes, jsonArgValues);
    } catch(error) {
        console.log(`Error occured during converting json lists of strings into kwargs json: ${error}`);
        return `Failed: ${error}`;
    }

    console.log(kwargs);

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

    argNames = JSON.parse(argNames);
    argTypes = JSON.parse(argTypes);
    argValues = JSON.parse(argValues);

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
                if (!validateAddress(value)) {
                    throw new Error(`Invalid Ethereum address for argument: ${name}`);
                }
                break;
            case "uint256":
                break;
            case "int256":
                break;
            case "bool":
                value = value.toLowerCase() === "true";
                break;
            case "bytes32":
                break;
            case "string":
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

    let jsonOutput = JSON.stringify(result, (key, value) => 
        typeof value === 'bigint' ? value.toString() : value
    , 2);

    return jsonOutput;
}