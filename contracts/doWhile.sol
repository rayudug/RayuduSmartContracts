//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

contract DoWhile{

    uint[] array; //dynamic array
    uint public j;
    function doWhile() public returns(uint[] memory){

        do{
            j++;
            array.push(j);
        }
        while(j<5);
        return array;
    }
}