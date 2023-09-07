//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Hello{

    function get() public pure returns(string memory){
        return "Hello,,WOrld";
    }

    function info() public pure returns(string memory){
        return get();   //calling view function from another view function
    }
}