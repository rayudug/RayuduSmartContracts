//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract SimpleMapping{
    mapping (uint => bool) public mymap;
    mapping(address => bool) public myaddressmap;
    function set(uint _i) public{
        mymap[_i]=true;
        
    }
    function setmyadd() public{
        myaddressmap[msg.sender]=true;
    }

    function get(uint _i) public view returns(bool){
        return mymap[_i];
    }

}