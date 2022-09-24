// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract foodTracker {
  
address owner;
constructor(){
  owner = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
}

  struct food{
    string name; 
    string description;
    string manufacturedFrom;
    bool isExpired;
    string quality ;
  }

mapping (uint => food) public foodTrackerMapping;


function addFoodItem(uint _foodId,string memory name,string memory manufacturedFrom,string memory description,string memory quality) public {
  foodTrackerMapping[_foodId].name = name;
  foodTrackerMapping[_foodId].manufacturedFrom = manufacturedFrom;
  foodTrackerMapping[_foodId].description = description;
  foodTrackerMapping[_foodId].isExpired = false;
  foodTrackerMapping[_foodId].quality = quality;
}


function ChangeExpireStatus(uint _foodId, bool _isExpired)public{
require(msg.sender == owner,"No One Is Allowed Accept Owner");
  foodTrackerMapping[_foodId].isExpired = _isExpired;
}


function ChangeQuality(uint _foodId,string memory  _quality)public{
require(msg.sender == owner,"No One Is Allowed Accept Owner");
  foodTrackerMapping[_foodId].quality = _quality;
}

function RemoveFoodItem(uint _foodId) public  returns (string memory) {
require(msg.sender == owner,"No One Is Allowed Accept Owner");

  delete foodTrackerMapping[_foodId];

return "FoodItemDeleted";
}

}

     
