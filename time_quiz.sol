// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Q6 {

    function setTime(uint _n) public pure returns(uint, uint, uint) {
        uint hour = _n / 3600;
        uint minute = (_n % 3600) / 60;
        uint second = _n % 60;
        return (hour, minute, second);
    }

}

