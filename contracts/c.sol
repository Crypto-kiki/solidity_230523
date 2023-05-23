// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/utils/Strings.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol"; 같음

contract C {
    // 라이브러리는 특별함. pure로 사용 가능함.
    function UtoS(uint _n) public pure returns(string memory) {
        return Strings.toString(_n);
    }
}