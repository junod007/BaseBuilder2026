// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HelloBase {
    string public message = "Hello Base!";

    function setMessage(string memory _message) public {
        message = _message;
    }
}
