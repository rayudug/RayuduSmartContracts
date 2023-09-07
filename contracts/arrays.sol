//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Array{

    uint[] array;  //dynamic
    uint[5] arr=[1,2,3,4,5];  //fixed
    
    function get(uint i) public view returns(uint){
        return arr[i];
    }
    function push(uint j) public {
        array.push(j);
    }

    function pop() public {
        array.pop();
    }

    function info() public view returns(uint[] memory){
        return array;
    }




}