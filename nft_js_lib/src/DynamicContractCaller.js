import { ethers, Interface } from 'ethers';
import { assignCheckNull, validateAddress} from './Utils.js';

class DynamicContractCaller {
    constructor(network, contractAddress, contractAbi) {
        validateAddress(contractAddress);
        if (!(network instanceof ethers.Network)) {
            console.error("Invalid network provided");
            console.error(new Error().stack);
            return;
        }

        const abi = JSON.parse(contractAbi);
        assignCheckNull(network, "Network not provided");

        this.contractAddress = assignCheckNull(contractAddress, "Contract address not provided");
        this.contracInterface = assignCheckNull(new Interface(abi["abi"]), "Interface not provided");
        this.provider = assignCheckNull(new ethers.BrowserProvider(window.ethereum, network), "Provider not found");
        this.signer = null;
        this.contract = null;
    }

    async init() {
        this.signer = assignCheckNull(await this.provider.getSigner(), "Signer not found");
        this.contract = assignCheckNull(new ethers.Contract(this.contractAddress, this.contracInterface, this.signer), "NFT Swapper contract not found");
        return this;
    }

    async runContractMethod(method, kwargsJson) {
        try {
            const args = JSON.parse(kwargsJson);
            console.log(`Received args:`, args);

            const methodFunc = this.contract[method];
            if (typeof methodFunc !== 'function') {
                throw new Error(`Method ${method} not found on contract`);
            }

            const result = methodFunc(...Object.values(args));

            let receipt;
            if (result instanceof Promise) {
                receipt = await result;
                console.log(`Receipt:`, receipt);

                if (receipt && receipt.transactionHash) {
                    console.log(`Contract completed with transaction: ${receipt.transactionHash}`);
                    return receipt.transactionHash;
                }
                else{
                    return `SUCCESS: ${receipt}`;
                }
            } else if (typeof result === 'string') {
                console.log(`Method returned string: ${result}`);
                return result;
            } else {
                throw new Error('Unexpected result type from contract method');
            }
        } catch (error) {
            console.error(`Error in runContractMethod:`, error);
            throw error;
        }
    }


}

export default DynamicContractCaller;
