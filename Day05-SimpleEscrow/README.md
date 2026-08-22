# 🔐 Day 05 – Simple Escrow

## 📌 Project Overview

This project is part of my Base Builder 2026 learning journey.

On Day 05, I built a simple escrow smart contract that allows ETH to be securely held between a buyer and a seller.

The buyer deposits ETH into the contract. After the transaction is completed, the buyer can release the payment to the seller. If the transaction is cancelled, the seller can refund the ETH back to the buyer.

---

## 🎯 Learning Goals

- Understand escrow smart contract logic
- Use `payable` functions
- Handle ETH deposits
- Transfer ETH between addresses
- Use constructor parameters
- Apply access control with `msg.sender`
- Manage contract states
- Prevent double release or refund
- Emit events for contract activity
- Deploy and interact with a smart contract on Base Sepolia

---

## ⚙️ How It Works

### 1. Deploy

The buyer deploys the contract and provides the seller's address.

```text
constructor(address _seller)
