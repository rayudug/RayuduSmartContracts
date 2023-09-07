//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

contract WhileLoop{
     
    uint[] array;  //dynamic sized array
    uint8 i=1;

    function arr() public returns(uint[] memory){
        
        while(i<=10){
            array.push(i);
            i++;  
        }
        array[5] = 55;
        array[9] = 1000;
        return array;
    }



}