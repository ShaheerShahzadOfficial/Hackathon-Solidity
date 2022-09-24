// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract HackathonTask2 {
  
  
address owner;
address pharmacy;
address dataAnalysts;


    constructor() {
         owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
         pharmacy = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
        dataAnalysts = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
}

struct Patient {
         address PatientAddress;
     uint256 ArrivalTime;
     string PatientName;
     string Disease;
} 

    Patient[] public patient;
mapping (address => Patient) public PatientMapping;


function AddPatient(string calldata _PatientName,string calldata _Disease) public {
     PatientMapping[msg.sender].PatientAddress = msg.sender;
     PatientMapping[msg.sender].ArrivalTime = block.timestamp;   
     PatientMapping[msg.sender].PatientName = _PatientName;
     PatientMapping[msg.sender].Disease = _Disease;
}

function AccessPatientData( address _PatientAddress) public view returns (string memory , address,string memory) {
  require(msg.sender == owner || msg.sender == pharmacy || msg.sender == dataAnalysts,"Owner , pharmacy , dataAnalysts is Allowed");

address patientAdd =  PatientMapping[_PatientAddress].PatientAddress ;
 string memory name =  PatientMapping[_PatientAddress].PatientName;
string memory disease =  PatientMapping[_PatientAddress].Disease;
return (name,patientAdd,disease);
}

function deletePatient (address _address) public {
  delete PatientMapping[_address];
}

}
