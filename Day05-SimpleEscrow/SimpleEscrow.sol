// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleEscrow {
    address public buyer;
    address public seller;

    uint256 public amount;
    bool public isFunded;
    bool public isReleased;
    bool public isRefunded;

    event Deposited(address indexed buyer, uint256 amount);
    event Released(address indexed seller, uint256 amount);
    event Refunded(address indexed buyer, uint256 amount);

    constructor(address _seller) {
        require(_seller != address(0), "Invalid seller");

        buyer = msg.sender;
        seller = _seller;
    }

    function deposit() external payable {
        require(msg.sender == buyer, "Only buyer can deposit");
        require(!isFunded, "Already funded");
        require(msg.value > 0, "Amount must be greater than zero");

        amount = msg.value;
        isFunded = true;

        emit Deposited(msg.sender, msg.value);
    }

    function release() external {
        require(msg.sender == buyer, "Only buyer can release");
        require(isFunded, "Escrow not funded");
        require(!isReleased, "Already released");
        require(!isRefunded, "Already refunded");

        isReleased = true;

        uint256 payment = amount;
        amount = 0;

        payable(seller).transfer(payment);

        emit Released(seller, payment);
    }

    function refund() external {
        require(msg.sender == seller, "Only seller can refund");
        require(isFunded, "Escrow not funded");
        require(!isReleased, "Already released");
        require(!isRefunded, "Already refunded");

        isRefunded = true;

        uint256 refundAmount = amount;
        amount = 0;

        payable(buyer).transfer(refundAmount);

        emit Refunded(buyer, refundAmount);
    }
}
