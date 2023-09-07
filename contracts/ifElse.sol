//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

contract IfElse{
     uint public num;
     string public text;

     function update(uint _num) public {
         num = _num;
     }

     function info() public returns (string memory){

         if(num < 10)
         {
            return  text = "num is less than 10";
         }
         else {
            return text = "num is greater than 10";
         }
     }

}