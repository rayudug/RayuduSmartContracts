//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract VendingMachine{
    address public owner;
    mapping(address => uint) public vending;
    constructor() {
        owner = msg.sender;
        vending[address(this)]=100;
    }
    modifier OnlyOwner(){
        require(msg.sender == owner);
        _;
    }

    function getBalance() public view returns(uint){
        return vending[address(this)];
    }
   function restock(uint amount) public OnlyOwner{
       vending[address(this)]+= amount;
   } 
    function purchase(uint amount) public payable{
       require(vending[address(this)]>= amount, "Not enough balance to pay");
       vending[address(this)]-= amount;
       vending[msg.sender]+= amount;
    }



    

}