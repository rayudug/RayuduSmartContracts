//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Mapping{
    struct hey{
        uint id;
    }
    mapping(string=>hey) public property;

        function set(string memory _str,uint _id) public{
            property[_str].id=_id;
        }

        function get(string memory _str) public view returns(uint){
            return property[_str].id;
        }

       function removeproperty(string memory _str) public {
           delete property[_str];
       }
    
}