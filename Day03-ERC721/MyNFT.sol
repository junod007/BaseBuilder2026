// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyNFT {

    string public name = "Base Builder NFT";
    string public symbol = "BBNFT";

    uint256 public totalSupply;

    mapping(uint256 => address) public ownerOf;

    function mint() public {
        totalSupply += 1;

        ownerOf[totalSupply] = msg.sender;
    }
}
