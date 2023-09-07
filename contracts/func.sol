//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Fun{
    function foo() public pure returns(string memory){
        return "RAYUDU";
    }
    function info() public view returns(address){
        return this;
    }
}