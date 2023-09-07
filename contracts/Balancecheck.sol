//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Balance{
    address public owner=msg.sender;
    function get() public view returns(uint){
        return owner.balance;
    }
}