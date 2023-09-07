//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract BinarySearch{
    uint[6] arr=[1,2,3,4,5,6];
    uint a;
    uint mid;
    function binary(uint key) public returns(uint){
        uint low=0;
        uint high=arr.length-1;
        while(low<=high){
            mid=(high-low)/2;
            if(arr[mid]==key){
                return mid;
            }
            else if(arr[mid]>key){
                high=mid-1;
            }
            else if(arr[mid]<key){
                low=mid+1;
            }
        }
        return 0;

    }

}