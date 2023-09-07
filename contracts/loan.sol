//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Loan{
   address owner;
   uint loanCount = 0;
   constructor(){
      owner = msg.sender;
   }
   modifier onlyOwner(){
       require(msg.sender == owner, "Not the owner");
       _;
   }
   struct loan{
       uint balance;
       uint interestRate;
       uint durationTime;
       uint loanCount;
   }
   mapping(uint => loan) public loans;
   function getLoan(uint _id,uint _amount,uint _totalField ) public onlyOwner{
       require(_amount > 0,"Amount should be greater than Zero");
       require(_totalField >= 3,"Total Field should be more than 3 Acres");
       loans[_id].loanCount++;
   }
   function approveLoan(uint _id,uint _amount,uint _interestRate) public onlyOwner returns(bool){
       loans[_id].interestRate = _interestRate;
       loans[_id].durationTime = block.timestamp + 365 days;  
       loans[_id].balance+= _amount;
       return true;
   }
   function getBalance(uint _id) public view returns(uint){
       return loans[_id].balance;
   }
}