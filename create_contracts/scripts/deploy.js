async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  // Grab the contract factory 
  const ZetaDeFiFactory = await ethers.getContractFactory("ZetaDeFi");

  // Define constructor arguments
  const tokenAddress = "0xdAC17F958D2ee523a2206206994597C13D831ec7";  // USDT Token address on Ethereum
  const interestRate = 100;  // Interest rate in basis points (1%)
  const depositLockTime = 86400;  // Deposit lock time in seconds (e.g., 1 day = 86400 seconds)

  // Deploy the contract with constructor arguments
  const zetaDeFi = await ZetaDeFiFactory.deploy(tokenAddress, interestRate, depositLockTime);

  // Log the entire contract object for debugging
  console.log("Deployed contract object:", zetaDeFi);

  // Output the contract address
  console.log("Contract deployed to address:", zetaDeFi.address);

  const fs = require('fs');

  // Append the contract address to .env
  if (zetaDeFi.address) {
      fs.appendFileSync('.env', `ZETA_DEFI_ADDRESS=${zetaDeFi.address}\n`);
      console.log("Contract address written to .env");
  } else {
      console.log("Contract address is undefined.");
  }

  // Write the contract ABI to a file
  const contract = require("../artifacts/contracts/ZetaDeFi.sol/ZetaDeFi.json");  // Correct the contract path
  fs.writeFileSync('./contract_abi/ZetaDeFi.json', JSON.stringify(contract.abi));
  console.log("Contract ABI written");
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
