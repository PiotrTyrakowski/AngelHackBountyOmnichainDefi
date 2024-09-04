import 'contract_info.dart';

List<ContractInfo> contractList = [
  ContractInfo(
      contractAddress: '0x1234567890abcdef1234567890abcdef12345678',
      ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef',
      contractDescription: 'This is a contract for managing tokens.',
      contractCode: 'token_contract_code',
      likes: 120,
      contractArguments: [
        FunctionArgument(type: 'uint256', name: 'initialSupply'),
        FunctionArgument(type: 'address', name: 'tokenOwner')
      ],
      returnValue: FunctionArgument(type: 'bool', name: 'success')),
  ContractInfo(
      contractAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef12345678',
      ownerAddress: '0x1234567890abcdef1234567890abcdef12345678',
      contractDescription: 'This contract handles voting on the platform.',
      contractCode: 'voting_contract_code',
      likes: 200,
      contractArguments: [
        FunctionArgument(type: 'string', name: 'candidate'),
        FunctionArgument(type: 'address', name: 'voterAddress')
      ],
      returnValue: FunctionArgument(type: 'bool', name: 'votedSuccessfully')),
  ContractInfo(
      contractAddress: '0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      ownerAddress: '0xbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
      contractDescription: 'This is a contract for decentralized finance.',
      contractCode: 'defi_contract_code',
      likes: 350,
      contractArguments: [
        FunctionArgument(type: 'uint256', name: 'amount'),
        FunctionArgument(type: 'address', name: 'recipient')
      ],
      returnValue: FunctionArgument(type: 'bool', name: 'transferSuccess')),
  ContractInfo(
      contractAddress: '0xcccccccccccccccccccccccccccccccccccccccc',
      ownerAddress: '0xdddddddddddddddddddddddddddddddddddddddd',
      contractDescription: 'A contract for digital asset ownership.',
      contractCode: 'nft_contract_code',
      likes: 500,
      contractArguments: [
        FunctionArgument(type: 'string', name: 'assetName'),
        FunctionArgument(type: 'address', name: 'ownerAddress')
      ],
      returnValue: FunctionArgument(type: 'bool', name: 'ownershipAssigned')),
  ContractInfo(
      contractAddress: '0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',
      ownerAddress: '0xffffffffffffffffffffffffffffffffffffffff',
      contractDescription: 'This is a smart contract for escrow services.',
      contractCode: 'escrow_contract_code',
      likes: 80,
      contractArguments: [
        FunctionArgument(type: 'uint256', name: 'depositAmount'),
        FunctionArgument(type: 'address', name: 'buyerAddress')
      ],
      returnValue: FunctionArgument(type: 'bool', name: 'escrowCreated')),
  ContractInfo(
      contractAddress: '0x9999999999999999999999999999999999999999',
      ownerAddress: '0x8888888888888888888888888888888888888888',
      contractDescription: 'This contract is for managing staking pools.',
      contractCode: 'staking_contract_code',
      likes: 275,
      contractArguments: [
        FunctionArgument(type: 'uint256', name: 'stakeAmount'),
        FunctionArgument(type: 'address', name: 'stakerAddress')
      ],
      returnValue: FunctionArgument(type: 'bool', name: 'stakedSuccessfully'))
];
