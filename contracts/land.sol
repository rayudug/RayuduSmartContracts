//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Land{
   address public owner;
   uint propertyvalue;
   modifier onlyOwner() {
       require(owner == msg.sender," you are not the owner");
       _;
   }
   constructor() {
       owner = msg.sender;
        propertyvalue = 0;
   }
   event valueChanged(uint _value);
   function setValue(uint _value) public onlyOwner{
       require(_value >30000 && _value <50000, "Value is too low");
       propertyvalue = _value;
       emit valueChanged(_value);

   }
   function getValue() public view returns(uint){
       return propertyvalue;
   }
}