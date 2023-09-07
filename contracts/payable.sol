//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Payable{
   address payable public owner;
   constructor(){
       owner = payable(msg.sender);
   }
   function deposit() external payable {  

   }
   function getBalance() public view returns(uint){
       return address(this).balance;
   }
   function getAddress() public view returns(address){
       return address(this);
   }
   function boo() public view returns(bool){
       require(msg.sender == address(this), "Not same");
       return true;
   }

}