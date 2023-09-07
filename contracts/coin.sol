// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract yourToken{
    address public minter;
    mapping (address=>uint) public balances;
    event sent(address from,address to,uint amount);
    constructor() {
        minter=msg.sender;
    }
    function mint(address receiver,uint amount) public payable{
        if(msg.sender!=minter) return;
        balances[receiver]+=amount;
    }
    function send(address receiver,uint amount) public{
        if(balances[msg.sender]<amount) return ;
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit sent(msg.sender,receiver,amount);
    }
}