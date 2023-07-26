//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Bank{
    address public owner;
    mapping(address =>uint) public balance;
        constructor(){
        owner = msg.sender;
    }

    function checkBalance() public view returns(uint){
        return balance[msg.sender];
    }
     
    function addBalance(uint _amount) public returns(uint){
        require(msg.sender == owner);
        balance[msg.sender]+= _amount;
        return balance[msg.sender];
    } 

    function transferAmount(address _receipent,uint _amount) public{
        require(balance[msg.sender]>=_amount, "Insufficient funds");
        require(msg.sender!=_receipent, "Invalid transfer");
        balance[msg.sender]-=_amount;
        balance[_receipent]+=_amount;
    }

}