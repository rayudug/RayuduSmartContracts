//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Array{
    uint[5] arr=[1,2,3,4,5];
    uint  public a;
    constructor(uint j){
          a=j;
    }
    function get() public view returns(uint){
        for(uint i=0;i<arr.length;i++){
            if(arr[i]==a){
                return i;
            }
        }
       
            return 0;
    }
}