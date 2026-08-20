# 🔨 Day 04 - Basic Auction

## 📌 Project Overview

This project is part of my **Base Builder 2026 learning journey**.

On Day 04, I built and deployed a simple smart contract called **BasicAuction** on the **Base Sepolia Testnet**.

The contract allows users to place bids using ETH. The highest bidder becomes the current winner, while previous bidders can withdraw their funds.

---

## 🎯 Learning Goals

- Understand `payable` functions
- Use `msg.value` for ETH payments
- Use `block.timestamp` for auction deadlines
- Store auction data using Solidity variables
- Handle refunds with the `withdraw` pattern
- Emit events from smart contracts
- Deploy and interact with a smart contract on Base Sepolia Testnet

---

## 📜 Smart Contract

Main contract:

```text
BasicAuction.sol
