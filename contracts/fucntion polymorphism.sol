//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Polymorphism{
    function get(string memory _str) public pure returns(string memory){
        return _str;
    }

    function get(uint _num) public pure returns(uint){  //same function name but different parameters
        return _num;
    }
}