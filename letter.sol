contract secret{


   mapping( address =>string) addToS;
   //지갑주인이 쓴 string 과 지갑주소 매핑 
   //addToS[보낸사람]은 해당사람이 쓴 string 

   mapping(address =>bytes) StoB;
   
    function setAdd(string memory _b) public {
        addToS[msg.sender]= _b;
    }
     
    function setStoB() public {
        StoB[msg.sender] = bytes(addToS[msg.sender]);
    }

    function getText() public view returns(string memory){
        return addToS[msg.sender];
    }

    function getSecretText() public  view returns(bytes memory){
        return StoB[msg.sender];
    }

    // 변환한 16진수를 다시 string으로 바꿔주는 함수
    
    function changeBtoS(bytes memory _secret) public pure returns(string memory){
        return  string(_secret);
    }
}