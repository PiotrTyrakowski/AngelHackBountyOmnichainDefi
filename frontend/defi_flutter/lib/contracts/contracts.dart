import 'contract_info.dart';

 List<ContractInfo> contractList = [
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345601',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef01',
    contractDescription: 'This is a token management contract.',
    contractTitle: 'Token Contract 1',
    contractCode: '''
pragma solidity ^0.8.0;

contract Token {
    string public name = "MyToken";
    mapping(address => uint256) public balances;

    constructor(uint256 initialSupply) {
        balances[msg.sender] = initialSupply;
    }

    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
''',
    numberOfLikes: 120,
    isLiked: false,
  ),
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345602',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef02',
    contractDescription: 'A smart contract for decentralized voting.',
    contractTitle: 'Voting Contract',
    contractCode: '''
pragma solidity ^0.8.0;

contract Voting {
    mapping(string => uint256) public votes;

    function vote(string memory candidate) public {
        votes[candidate]++;
    }

    function getVotes(string memory candidate) public view returns (uint256) {
        return votes[candidate];
    }
}
''',
    numberOfLikes: 200,
    isLiked: true,
  ),
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345603',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef03',
    contractDescription: 'Contract for decentralized finance (DeFi).',
    contractTitle: 'DeFi Contract',
    contractCode: '''
pragma solidity ^0.8.0;

contract DeFi {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
    }
}
''',
    numberOfLikes: 320,
    isLiked: false,
  ),
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345604',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef04',
    contractDescription: 'A contract for managing digital assets (NFTs).',
    contractTitle: 'NFT Contract',
    contractCode: '''
pragma solidity ^0.8.0;

contract NFT {
    mapping(uint256 => address) public ownerOf;

    function mint(uint256 tokenId) public {
        require(ownerOf[tokenId] == address(0), "Token already exists");
        ownerOf[tokenId] = msg.sender;
    }

    function transfer(uint256 tokenId, address to) public {
        require(ownerOf[tokenId] == msg.sender, "Not the owner");
        ownerOf[tokenId] = to;
    }
}
''',
    numberOfLikes: 450,
    isLiked: true,
  ),
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345605',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef05',
    contractDescription: 'This contract facilitates escrow services.',
    contractTitle: 'Escrow Contract',
    contractCode: '''
pragma solidity ^0.8.0;

contract Escrow {
    address public buyer;
    address public seller;
    uint256 public amount;

    constructor(address _seller) {
        buyer = msg.sender;
        seller = _seller;
    }

    function deposit() public payable {
        require(msg.sender == buyer, "Only buyer can deposit");
        amount = msg.value;
    }

    function release() public {
        require(msg.sender == buyer, "Only buyer can release");
        payable(seller).transfer(amount);
    }
}
''',
    numberOfLikes: 80,
    isLiked: false,
  ),
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345606',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef06',
    contractDescription: 'A staking contract for blockchain pools.',
    contractTitle: 'Staking Contract',
    contractCode: '''
pragma solidity ^0.8.0;

contract Staking {
    mapping(address => uint256) public stakes;

    function stake() public payable {
        stakes[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(stakes[msg.sender] >= amount, "Insufficient stake");
        payable(msg.sender).transfer(amount);
        stakes[msg.sender] -= amount;
    }
}
''',
    numberOfLikes: 300,
    isLiked: true,
  ),
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345607',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef07',
    contractDescription: 'A contract for supply chain management.',
    contractTitle: 'Supply Chain Contract',
    contractCode: '''
pragma solidity ^0.8.0;

contract SupplyChain {
    struct Product {
        string name;
        uint256 timestamp;
    }

    mapping(uint256 => Product) public products;

    function addProduct(uint256 productId, string memory name) public {
        products[productId] = Product(name, block.timestamp);
    }

    function getProduct(uint256 productId) public view returns (string memory name, uint256 timestamp) {
        Product memory product = products[productId];
        return (product.name, product.timestamp);
    }
}
''',
    numberOfLikes: 150,
    isLiked: false,
  ),
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345608',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef08',
    contractDescription: 'This contract manages healthcare records.',
    contractTitle: 'Healthcare Contract',
    contractCode: '''
pragma solidity ^0.8.0;

contract Healthcare {
    struct Record {
        string patientName;
        string diagnosis;
    }

    mapping(address => Record) public records;

    function addRecord(string memory patientName, string memory diagnosis) public {
        records[msg.sender] = Record(patientName, diagnosis);
    }

    function getRecord(address patient) public view returns (string memory patientName, string memory diagnosis) {
        Record memory record = records[patient];
        return (record.patientName, record.diagnosis);
    }
}
''',
    numberOfLikes: 220,
    isLiked: true,
  ),
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345609',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef09',
    contractDescription: 'A contract for decentralized insurance.',
    contractTitle: 'Insurance Contract',
    contractCode: '''
pragma solidity ^0.8.0;

contract Insurance {
    struct Policy {
        string policyHolder;
        uint256 coverageAmount;
    }

    mapping(address => Policy) public policies;

    function createPolicy(string memory policyHolder, uint256 coverageAmount) public {
        policies[msg.sender] = Policy(policyHolder, coverageAmount);
    }

    function claim() public view returns (string memory policyHolder, uint256 coverageAmount) {
        Policy memory policy = policies[msg.sender];
        return (policy.policyHolder, policy.coverageAmount);
    }
}
''',
    numberOfLikes: 110,
    isLiked: false,
  ),
  ContractInfo(
    contractAddress: '0x1234567890abcdef1234567890abcdef12345610',
    ownerAddress: '0xabcdefabcdefabcdefabcdefabcdefabcdef10',
    contractDescription: 'A crowdfunding contract for projects.',
    contractTitle: 'Crowdfunding Contract',
    contractCode: '''
pragma solidity ^0.8.0;

contract Crowdfunding {
    mapping(address => uint256) public contributions;

    function contribute() public payable {
        contributions[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(contributions[msg.sender] >= amount, "Insufficient funds");
        payable(msg.sender).transfer(amount);
        contributions[msg.sender] -= amount;
    }
}
''',
    numberOfLikes: 500,
    isLiked: true,
  ),
];
