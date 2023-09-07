//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract FunctionPolymorphism{
   // uint private side;
    function getarea(uint side) public pure returns(uint radius){
      radius = side * side;
    }
    function getarea() public pure returns(string memory){
        return "HELLO";
    }
}