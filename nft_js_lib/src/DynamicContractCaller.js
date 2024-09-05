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

        assignCheckNull(network, "Network not provided");

        this.contractAddress = assignCheckNull(contractAddress, "Contract address not provided");
        this.contracInterface = assignCheckNull(new Interface(contractAbi), "Interface not provided");
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
        const args = JSON.parse(kwargsJson);
        console.log(`Received args: ${args}`)

        const completeTx = await this.contract[method](args);
        const receipt = await completeTx.wait();

        console.log(`${receipt}`);
        console.log(`Contract completed with transaction: ${receipt.transactionHash}`);
        return receipt.transactionHash;
    }

}

export default DynamicContractCaller;
