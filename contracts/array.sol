//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Array{
    uint[] array=[1,2,3,4,5];
    function removearray(uint index) public{
        array[index] = array[array.length-1];
       // remove(1); 
        array.pop();
        array.push(100);
        delete array[index];  //deletes elemnt and inserts default value in it (i.e. zero in this case)
    }
    
    function getarray() public view returns(uint[] memory){
        return array;
    }
    
   
}