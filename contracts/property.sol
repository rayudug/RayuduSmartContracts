// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract  propertyTransferApp{
    address public contractowner;
    constructor() {
        contractowner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == contractowner, "Not the owner");
        _;                    // it means to continue the execution of the fucntion
    }
    struct property{
        uint256 id;
        string name;
        string owner;
        uint256 value;
        uint256 area;
    }
    mapping(uint256 =>property) public properties;
    
    function addproperty(
    uint256 _propertyid,
    string memory _name,
    string memory _owner,
    uint256 _value,
    uint256 _area
    ) public onlyOwner{
        properties[_propertyid].name=_name;
        properties[_propertyid].owner=_owner;
        properties[_propertyid].value=_value;
        properties[_propertyid].area=_area;
    }
    function queryPropertyById(uint256 _propertyid)
    public view returns(
        string memory name,
        string memory owner,  
        uint256 area,
        uint256 value
        )
        {
        return (
            properties[_propertyid].name,
            properties[_propertyid].owner,
            properties[_propertyid].value,
            properties[_propertyid].area
        );
    }
    function transforpropertyownership(
        uint256 _propertyid,
        string memory _newowner) public{
            properties[_propertyid].owner=_newowner;
        }
}