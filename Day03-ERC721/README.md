# Day 03 - Building an ERC721 NFT

Today I built and deployed a custom ERC721-style NFT smart contract as part of my Base Builder journey.

## Deployment

**Network:** Base Sepolia Testnet

**Contract Address:**
`0xB4fdcA6fFc2b495872ACdc5759dc81476aB01538`

**Deployer:**
`0x12a8a89295926939b3cB161e8990E74f4D365093`

---

## Testing

### Minting

Successfully minted:

- Token ID #1
- Token ID #2

### Ownership

Tested ownership tracking:

**ownerOf(1):**
`0x12a8a89295926939b3cB161e8990E74f4D365093`

**ownerOf(2):**
`0x9A714f53aF39599F70DB234f52da66fBbaC06714`

### Token URI

Successfully verified metadata URIs:

- Token ID #1  
  `https://example.com/metadata/1`

- Token ID #2  
  `https://example.com/metadata/2`

## Features

- ERC721-style NFT functionality
- Unique token ownership tracking
- Token balances
- Mint new NFTs
- Maximum supply limit
- Minting pause control
- Token URI storage

## Tools Used

- Solidity
- Remix IDE
- MetaMask
- Base Sepolia Testnet
