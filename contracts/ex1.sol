//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Ex{
    address public owner=msg.sender;
    function get() public view returns(address){
        return owner;

    }

    function set() public view returns(address){
        return address(this);
    }
}