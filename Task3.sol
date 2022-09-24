// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract HackathonTask3{



struct Package {
string PackageName;     
 uint NoOfBagges;
 string DeliveringAddress;
  string CurrentAddress;
 string RecieversName;
 address RecieversAddress;
 bool isDelivered;       
} 

mapping (uint => Package) public PackageMapping;

function AddPackage ( uint PackageId,  address _RecieversAddress, string calldata _RecieversName,uint _NoOfBagges,string calldata _CurrentAddress,string calldata _PackageName,string calldata _DeliveringAddress ) public {
  PackageMapping[PackageId].RecieversAddress = _RecieversAddress;
    PackageMapping[PackageId].RecieversName = _RecieversName;   
    PackageMapping[PackageId].NoOfBagges = _NoOfBagges;
    PackageMapping[PackageId].CurrentAddress = _CurrentAddress;
    PackageMapping[PackageId].PackageName = _PackageName;
    PackageMapping[PackageId].DeliveringAddress = _DeliveringAddress;
        PackageMapping[PackageId].isDelivered = false;
}

function changeCuurentAddress (uint PackageId,string calldata _CurrentAddress) public {
    PackageMapping[PackageId].CurrentAddress = _CurrentAddress;
}

function checkLocationOfParcel (uint PackageId) public view  returns (string memory){
 string memory _CurrentAddress =    PackageMapping[PackageId].CurrentAddress;

    return _CurrentAddress;
}


function DeliveredParcel (uint PackageId) public   returns (string memory){
   PackageMapping[PackageId].isDelivered = true ;
   return("The Parcel Has Been Delivered");
}


}

