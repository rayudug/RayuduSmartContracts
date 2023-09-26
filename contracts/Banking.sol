//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Banking{
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    mapping(address => uint) userAccount;
    mapping(address => bool) public userExist;
    function createAccount(address _add) public returns(string memory){
        require(userExist[_add] == false, "Account already created");
        userAccount[_add] = 0;
        userExist[_add] = true;
        return "Account Created Successfully";
    }
    function deposit(uint amount) public payable returns(string memory){
       require(userExist[msg.sender] == true, "Account not created");
       require(amount > 0 ,"Amount depositing is Zero");
       userAccount[msg.sender]+= amount;
       return "Amount Deposited Successfully";
    }
    function withdraw(uint amount) public payable returns(string memory){
        require(userExist[msg.sender] == true, "Account not created");
        require(userAccount[msg.sender] >= amount, "Insufficient Funds");
        userAccount[msg.sender]-= amount;
        return "Withdraw successful";
    }
    function transfer(address payable receipent,uint amount) public returns(string memory){
        require(userExist[msg.sender] == true, "Account not created");
        require(userExist[receipent] == true, "Account not created");
        require(userAccount[msg.sender] > amount,"Insufficient Balance");
        userAccount[msg.sender]-= amount;
        userAccount[receipent]+= amount;
        return "Transfered Successfully";
    }
    function userAccountBalance(address _add) public view returns(uint){
        return userAccount[_add];
    }

}