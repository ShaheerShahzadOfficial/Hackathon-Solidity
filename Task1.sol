// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Hackathon{

address owner;

    constructor() {
         owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
}

struct Stakerperson{
         address StackHolder;
     uint256 stakingAmount;
     bool acceptChange;
     bool isChange;  
} 


mapping (address => Stakerperson) public Stakermapping;

function AddAssets() public payable  {
 Stakermapping[msg.sender].stakingAmount = msg.value;
 Stakermapping[msg.sender].StackHolder =msg.sender;

}

function SeeAlllStack(address _address) public  view  returns(uint)  {

  require(msg.sender == owner ,"No One is Allowed Accept Owner");

    uint256 amount =  Stakermapping[_address].stakingAmount ;

return amount;

}


function ChangeStack(address _address,uint _amount) public   returns(string memory,address)  {

  require(msg.sender == owner ,"No One is Allowed Accept Owner");

      
 Stakermapping[_address].stakingAmount = _amount;
  Stakermapping[_address].isChange = true;


return ("The Stack Has Been Changed for ",_address) ;

}


function AcceptChange(address _address) public   returns(string memory,address)  {

  require(msg.sender == owner ,"No One is Allowed Accept Owner");

      
  Stakermapping[_address].acceptChange = true;


return ("The Stack Change Has Been Accepted for ",_address) ;

}


}
