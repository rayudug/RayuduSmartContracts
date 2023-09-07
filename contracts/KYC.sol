//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract KYC{
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner(){
         require(msg.sender == owner, "Not the owner");
         _;
    }
    mapping(address => bool) public accountVerify;
   function verifyUser(address _acc) public onlyOwner(){
       accountVerify[_acc] = true;
   }
   function revokeUser(address _acc) public onlyOwner(){
       accountVerify[_acc] = false;
   }
   function isVerified(address _acc) public view returns(bool){
       return accountVerify[_acc];
   }
}