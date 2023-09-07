// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract variables{
    uint num;   //state variables  gets stored permanently in contract

    constructor(uint _num) {
        num=_num;   //initialized state variable using constructor
    }
    function get() public view returns(uint){
        uint res=num+10;  //local variable  are not stored in contract

        return num;        //accessing state variable
    }

}