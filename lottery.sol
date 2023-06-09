// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
로또 프로그램을 만드려고 합니다. 숫자와 문자는 각각 4개 2개를 뽑습니다. 6개가 맞으면 1이더, 5개의 숫자가 순서와 함께 맞으면 0.75이더, 4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. 

참가 금액은 0.05이더이다.

기준 숫자 : 1,2,3,4,A,B
-----------------------------------------------------------------
기준 숫자 설정 기능 : 5개의 사람이 임의적으로 4개의 숫자와 2개의 문자를 넣음. 5명이 넣은 숫자들의 중앙값과 알파벳 순으로 따졌을 때 가장 가운데 문자로 설정
예) 숫자들의 중앙값 : 1,3,6,8,9 -> 6 // 2,3,4,8,9 -> 4
예) 문자들의 중앙값 : a,b,e,h,l -> e // a,h,i,q,z -> i
*/

contract lottery {

    struct number {
        uint a;
        uint b;
        uint c;
        uint d;
        bytes e;
        bytes f;
    }

    // number[] numbers;


    mapping(address => number) participant;
    uint fee = 5 * (10 ** 16);

    function join(uint _a, uint _b, uint _c, uint _d, string memory _e, string memory _f) public payable {
        require(msg.value == fee, "you don't have fee");
        require(_a < 9 && _b < 9 && _c < 9 && _d < 9);
        require(bytes(_e).length == 1 && bytes(_f).length == 1);

        bytes memory e = abi.encodePacked(_e);
        bytes memory f = abi.encodePacked(_f);

        participant[msg.sender] = number(_a, _b, _c, _d, e, f);
    }

    function checkNumber(address _a) public view returns(number memory) {
        return participant[_a];
    }


}