//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Land{
    address public owner;
    modifier onlyOwner(){
        require(msg.sender == owner,"Only owner has to update");
        _;
    }
    constructor(){
        owner = msg.sender;
    }
    struct property{
        string ownerName;
        string name;
        uint ownerContact;
        uint ownerAadhar;
        uint area;
        uint price;
        uint balance;
    }
    mapping(uint => property) public land;  
    function register(uint _id,string memory _ownerName,string memory _name,uint _ownerContact,uint _area,uint _ownerAadhar,uint _price) external onlyOwner {
        require(bytes(_ownerName).length > 0, "Owner Name should not be empty");
        require(_area > 0, "Area need to be specified");
        require(_id > 0,"ID is required");
        land[_id].ownerName = _ownerName;
        land[_id].name = _name;
        land[_id].ownerContact = _ownerContact;
        land[_id].area = _area;
        land[_id].ownerAadhar = _ownerAadhar;
        land[_id].price = _price;
    }
    function updateLand(uint _price,uint _id,string memory _newOwner,uint _newAadhar,uint _newContact) public onlyOwner {
        land[_id].ownerName = _newOwner;
        land[_id].balance+= _price;   // balance to msg.sender
        land[_id].ownerAadhar = _newAadhar;
        land[_id].ownerContact = _newContact;
    }
    

}