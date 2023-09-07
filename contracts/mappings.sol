//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Mapping{
    mapping(address=>uint) public map;  //map always returns uint.
    address[] uint_map;
    function set(address _add,uint _i) public{
        map[_add]=_i;
    }

    function get(address _add) public view returns(uint){
        return map[_add];
    }
    function remove(address _add) public{
        delete map[_add];
    } 
    

}
contract Nestedmapping{
    mapping(address=>mapping(string=>uint)) public mm;
    function set(address _add,string memory _str,uint _i) public{
        mm[_add][_str]=_i;
    }
   function get(address _add,string memory _str) public  view returns(uint){
        return mm[_add][_str];
   }
   


}
