// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Example{
    uint public num;
    function getval(uint val) public {
          num=val;
    }
    function info() public view returns(uint){
        return num;
    }
}