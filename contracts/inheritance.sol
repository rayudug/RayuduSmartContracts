//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract A{
    function info() public view virtual returns(string memory){
        return "A";
    }
}

contract B{
    function get() public view virtual returns (string memory){
        return "B";
    }
}

contract C is A,B{
    function info() public pure override(A) returns (string memory){
        return "AC";
    }
    function get() public pure override(B) returns(string memory){
        return "BC";
    }
}
