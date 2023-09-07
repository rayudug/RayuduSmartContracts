//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Local{
    uint public num;  //state variable

    function local() public returns(uint,address){
        uint a= 500;  //local variable
        num = a;
        address myAddress= address(2);
        return (num,myAddress);

    }
}