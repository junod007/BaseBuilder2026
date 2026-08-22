# 🔐 Day 05 - Simple Escrow

## 📌 Project Overview

This project is part of my Base Builder 2026 learning journey.

On Day 05, I built a simple escrow smart contract called `SimpleEscrow`.

The contract allows a buyer to deposit ETH into the escrow. Once the conditions are met, the buyer can release the funds to the seller. If necessary, the buyer can also request a refund.

## 🎯 Learning Goals

- Understand the escrow smart contract pattern
- Use `payable` functions
- Handle ETH deposits using `msg.value`
- Use access control with `require`
- Track contract state with boolean variables
- Transfer ETH between addresses
- Emit events for contract activity
- Deploy and interact with a smart contract on Base Sepolia Testnet

## ✨ Features

- Buyer and seller addresses are defined when the contract is deployed
- Only the buyer can deposit ETH
- ETH can only be deposited once
- Only the buyer can release the funds
- Funds are transferred to the seller after release
- Buyer can request a refund before funds are released
- Events are emitted for deposits, releases, and refunds

## 📄 Smart Contract

Main contract:

```text
SimpleEscrow.sol
