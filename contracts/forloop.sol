//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

contract ForLoop{

    uint256[]  public arr;  //dynamic array
   // uint public i;
    function loop() public returns(uint256[] memory){
    for(uint256 i = 0; i < 10; i++){
        arr.push(i);
    }
    return arr;
    }

}