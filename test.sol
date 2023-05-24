// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract test {

    bytes letter;

    function letters(string memory _a) public {
        letter = bytes(_a);
    }

    function check() public view returns(bytes memory) {
        return letter;
    }

    function bytes_to_string(bytes memory _a) public pure returns(string memory) {
        return string(_a);
    }

}