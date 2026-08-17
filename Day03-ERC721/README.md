# Day 03 - Building an ERC721 NFT

Today I built a custom ERC721-style NFT smart contract as part of my Base Builder journey.

## Contract

**Contract Name:** MyNFT  
**Token Name:** Base Builder NFT  
**Symbol:** BBNFT  
**Network:** Base Sepolia Testnet

## Features

- ERC721-style NFT functionality
- Unique token ownership tracking
- Token balances
- Mint new NFTs
- Maximum supply limit
- Minting pause control
- Contract owner control
- Token approvals
- Operator approvals
- Transfer NFTs
- Safe transfer NFTs
- Base metadata URI
- `tokenURI()` support
- `totalSupply()` tracking

## Smart Contract Functions

### Minting
- `mint()`
- `setMintingPaused(bool)`
- Maximum supply protection

### Ownership
- `ownerOf(uint256)`
- `balanceOf(address)`
- `transferFrom(address,address,uint256)`
- `safeTransferFrom(address,address,uint256)`

### Approvals
- `approve(address,uint256)`
- `getApproved(uint256)`
- `setApprovalForAll(address,bool)`
- `isApprovedForAll(address,address)`

### Metadata
- `name()`
- `symbol()`
- `tokenURI(uint256)`
- `setBaseURI(string)`

### Supply
- `totalSupply()`
- `maxSupply()`

## What I Learned

Today I learned how an NFT contract manages individual token IDs and ownership.

Unlike ERC20 tokens, where each token unit is interchangeable, every ERC721 token has a unique identifier.

I also learned how to implement:

- Token ownership mappings
- Balance tracking
- Token approvals
- Operator approvals
- NFT transfers
- Safe transfers
- Minting limits
- Pausing minting
- Metadata URI generation

## Testing

The contract was tested in Remix IDE using the Base Sepolia Testnet.

Tested functions:

- Contract deployment
- NFT minting
- `ownerOf()`
- `tokenURI()`
- `totalSupply()`

All tests completed successfully.

## Project Structure

```text
Day03-ERC721/
├── MyNFT.sol
└── README.md
