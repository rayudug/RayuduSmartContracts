//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Global{
    address public owner;   //state variable
     constructor (){

             owner = msg.sender;
             difficulty=block.difficulty;
             gaslimit=block.gaslimit;
             timestamp=block.timestamp;
             Firstfour=msg.sig;

         }
         function get() public view returns(address){
             return owner;
         }
        uint public difficulty;
        uint public timestamp;
        uint public number;
        //address public owner;
        uint public gasprice;
        uint public gaslimit;
        bytes public Firstfour;
        
}