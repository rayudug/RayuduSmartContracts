//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract ErrorHandling{
    function check(uint i) public pure returns(string memory){
        require(i>=0, "Invalid input");
        require(i<=200, "Inavlid error");
        return "Valid input";
    }

    function info(uint k) public pure returns(bool){
        require(k%2==0,"K is odd value");
        return true;
    }
}