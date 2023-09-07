//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Example{
     function info(uint _i) public pure {
          require(_i<10, "I is greater than 10");
     }
     function boo(uint i) public pure returns(bool){
         if(i>10){
             revert("I is greater than 10");
         }
         else {
         return true;
         }
            
     }

}