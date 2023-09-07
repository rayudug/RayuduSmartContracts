//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Pure{

    uint a=5;
    uint b=10;  //state variables

    function getPure() public pure returns(uint){
        uint num1=10;
        uint num2=20;  //local variables
        uint res=num1 + num2;
        return res;

    }
    function get() public view returns(uint){

        uint aa=4;  //local variable
        uint product = aa * a;
        return product;
    }
}