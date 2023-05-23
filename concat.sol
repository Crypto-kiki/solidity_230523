// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
숫자를 시분초로 변환하세요.
예) 100 -> 1분 40초, 600 -> 10분, 1000 -> 16분 40초, 5250 -> 1시간 27분 30초
*/

contract Q7 {
    function setTime(uint _n) public pure returns(uint, uint, uint) {
        uint hour = _n/3600 ;
        uint minute = (_n%3600)/60 ; // min = (_n/60)%60;
        uint second = _n%60 ;
        return(hour, minute, second);
    }
}

contract Q5 {
    function divideNumber(uint _n) public pure returns(uint[] memory) {
        uint[] memory b = new uint[](getLength(_n));

        uint i=getLength(_n);
        while(_n !=0) {
            b[--i] = _n%10;
            _n = _n/10;
        }
        return (b);
    }

    function getLength(uint _n) public pure returns(uint) {
        if(_n==0) {
            return 1;
        }

        uint a;
        while(_n >= 10**a) {
            a++;
        }
        return a;
    }
}

contract CONCAT {
    Q5 q5 = new Q5();
    Q7 q7 = new Q7();

    function concat(uint a) public view returns(string memory) {
        uint b = q5.getLength(a);
        uint[] memory c = new uint[](b);
        c = q5.divideNumber(a);
        for(uint i=0; i<c.length; i++) {
            c[i] += 48;
        }
        return string(abi.encodePacked(c));
    }

    function getConcat(uint _n) public view returns(string memory) {
        return string(abi.encodePacked(concat(_n), "hours"));
    }

    function concat6(uint _n) public view returns(uint, uint, uint /*string memory*/) {
        (uint a, uint b, uint c) = q7.setTime(_n);
        return (a,b,c);
    }

    function concat7(uint _n) public view returns(string memory) {
        (uint a, uint b, uint c) = q7.setTime(_n);
        return string(abi.encodePacked(concat(a),"hours ", concat(b), "minutes ", concat(c), "seconds"));
    }
}