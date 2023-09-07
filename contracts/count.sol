// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Count{
     uint count=0;
    function increment() public{
       count+=1;
    }
    function decrement() public {
        count-=1;
    }
    function get() public view returns(uint){
        return count;
    }
}