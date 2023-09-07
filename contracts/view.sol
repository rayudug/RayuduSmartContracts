//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.17;
contract View{
bytes public owner;
  function get() public payable returns(bytes memory){
      return owner;
  }
}