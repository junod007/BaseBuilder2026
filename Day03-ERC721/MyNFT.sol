// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyNFT {
    // NFT Information
    string public name = "Base Builder NFT";
    string public symbol = "BBNFT";

    // Contract owner
    address public owner;

    // Supply settings
    uint256 public totalSupply;
    uint256 public immutable maxSupply;

    // Minting control
    bool public mintingPaused;

    // Base metadata URI
    string private baseTokenURI;

    // ERC721 ownership
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;

    // ERC721 approvals
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    // Events
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );

    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    event MintingPaused(bool status);
    event BaseURIUpdated(string newBaseURI);

    // Constructor
    constructor(
        uint256 _maxSupply,
        string memory _baseURI
    ) {
        owner = msg.sender;
        maxSupply = _maxSupply;
        baseTokenURI = _baseURI;
    }

    // Modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    modifier tokenExists(uint256 tokenId) {
        require(_owners[tokenId] != address(0), "Token does not exist");
        _;
    }

    // Check token owner
    function ownerOf(
        uint256 tokenId
    )
        public
        view
        tokenExists(tokenId)
        returns (address)
    {
        return _owners[tokenId];
    }

    // Check NFT balance
    function balanceOf(
        address account
    )
        public
        view
        returns (uint256)
    {
        require(account != address(0), "Zero address");
        return _balances[account];
    }

    // Mint NFT
    function mint() public {
        require(!mintingPaused, "Minting is paused");
        require(totalSupply < maxSupply, "Max supply reached");

        totalSupply++;

        uint256 tokenId = totalSupply;

        _owners[tokenId] = msg.sender;
        _balances[msg.sender]++;

        emit Transfer(address(0), msg.sender, tokenId);
    }

    // Approve another address
    function approve(
        address to,
        uint256 tokenId
    )
        public
        tokenExists(tokenId)
    {
        address tokenOwner = ownerOf(tokenId);

        require(
            msg.sender == tokenOwner ||
            isApprovedForAll(tokenOwner, msg.sender),
            "Not authorized"
        );

        _tokenApprovals[tokenId] = to;

        emit Approval(tokenOwner, to, tokenId);
    }

    // Check approved address
    function getApproved(
        uint256 tokenId
    )
        public
        view
        tokenExists(tokenId)
        returns (address)
    {
        return _tokenApprovals[tokenId];
    }

    // Approve operator
    function setApprovalForAll(
        address operator,
        bool approved
    )
        public
    {
        _operatorApprovals[msg.sender][operator] = approved;

        emit ApprovalForAll(
            msg.sender,
            operator,
            approved
        );
    }

    // Check operator approval
    function isApprovedForAll(
        address account,
        address operator
    )
        public
        view
        returns (bool)
    {
        return _operatorApprovals[account][operator];
    }

    // Transfer NFT
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    )
        public
        tokenExists(tokenId)
    {
        require(to != address(0), "Cannot transfer to zero address");
        require(
            _isApprovedOrOwner(msg.sender, tokenId),
            "Not authorized"
        );

        require(
            ownerOf(tokenId) == from,
            "Incorrect owner"
        );

        // Clear approval
        delete _tokenApprovals[tokenId];

        // Update balances
        _balances[from]--;
        _balances[to]++;

        // Transfer ownership
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    // Internal authorization check
    function _isApprovedOrOwner(
        address spender,
        uint256 tokenId
    )
        internal
        view
        returns (bool)
    {
        address tokenOwner = ownerOf(tokenId);

        return (
            spender == tokenOwner ||
            getApproved(tokenId) == spender ||
            isApprovedForAll(tokenOwner, spender)
        );
    }

    // Get token metadata URI
    function tokenURI(
        uint256 tokenId
    )
        public
        view
        tokenExists(tokenId)
        returns (string memory)
    {
        return string(
            abi.encodePacked(
                baseTokenURI,
                _toString(tokenId)
            )
        );
    }

    // Update base URI
    function setBaseURI(
        string memory newBaseURI
    )
        public
        onlyOwner
    {
        baseTokenURI = newBaseURI;

        emit BaseURIUpdated(newBaseURI);
    }

    // Pause or unpause minting
    function setMintingPaused(
        bool status
    )
        public
        onlyOwner
    {
        mintingPaused = status;

        emit MintingPaused(status);
    }

    // Transfer contract ownership
    function transferOwnership(
        address newOwner
    )
        public
        onlyOwner
    {
        require(
            newOwner != address(0),
            "Zero address"
        );

        owner = newOwner;
    }

    // Convert uint256 to string
    function _toString(
        uint256 value
    )
        internal
        pure
        returns (string memory)
    {
        if (value == 0) {
            return "0";
        }

        uint256 temp = value;
        uint256 digits;

        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        bytes memory buffer = new bytes(digits);

        while (value != 0) {
            digits--;

            buffer[digits] = bytes1(
                uint8(48 + value % 10)
            );

            value /= 10;
        }

        return string(buffer);
    }
}
