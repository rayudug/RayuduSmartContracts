//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract MappingsStructExample {

    address public owner;
    constructor(){
        owner = msg.sender;
    }
    mapping(address => uint) public balance;

    function getBalance() public view returns(uint) {
        return owner.balance;
    }

    function sendMoney(address _receiver,uint _amount) public  {
        balance[msg.sender]-=_amount;
        balance[_receiver] += _amount;
    }

    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balance[msg.sender];
        balance[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }
}
