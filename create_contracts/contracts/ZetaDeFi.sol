// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";  // Import the ERC20 interface
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZetaDeFi is Ownable {
    IERC20 public token;  // ERC20 token used for deposits and interest accrual
    uint256 public interestRate;  // Interest rate in basis points (e.g., 100 = 1%)
    uint256 public depositLockTime;  // Time to lock deposits (in seconds)

    struct Deposit {
        uint256 amount;
        uint256 startTime;
    }

    mapping(address => Deposit) public deposits;  // Track user deposits

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount, uint256 interest);

    // Constructor that passes msg.sender as the initial owner
    constructor(IERC20 _token, uint256 _interestRate, uint256 _depositLockTime) Ownable(msg.sender) {
        token = _token;
        interestRate = _interestRate;  // Example: 100 means 1% interest
        depositLockTime = _depositLockTime;  // Time users must wait to withdraw
    }

    // Deposit function
    function deposit(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(deposits[msg.sender].amount == 0, "Already have an active deposit");

        token.transferFrom(msg.sender, address(this), amount);
        deposits[msg.sender] = Deposit(amount, block.timestamp);

        emit Deposited(msg.sender, amount);
    }

    // Withdraw function with interest
    function withdraw() external {
        Deposit memory userDeposit = deposits[msg.sender];
        require(userDeposit.amount > 0, "No active deposit");
        require(block.timestamp >= userDeposit.startTime + depositLockTime, "Deposit is locked");

        uint256 interest = calculateInterest(userDeposit.amount, userDeposit.startTime);
        uint256 totalAmount = userDeposit.amount + interest;

        delete deposits[msg.sender];  // Clear the user's deposit
        token.transfer(msg.sender, totalAmount);

        emit Withdrawn(msg.sender, userDeposit.amount, interest);
    }

    // Calculate interest based on time passed
    function calculateInterest(uint256 amount, uint256 startTime) public view returns (uint256) {
        uint256 duration = block.timestamp - startTime;
        uint256 interest = (amount * interestRate * duration) / (365 days * 10000);
        return interest;
    }

    // Owner can update interest rate
    function setInterestRate(uint256 _interestRate) external onlyOwner {
        interestRate = _interestRate;
    }

    // Owner can update deposit lock time
    function setDepositLockTime(uint256 _depositLockTime) external onlyOwner {
        depositLockTime = _depositLockTime;
    }

    // Owner can withdraw any leftover tokens in the contract
    function withdrawTokens(uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than 0");
        token.transfer(msg.sender, amount);
    }
}
