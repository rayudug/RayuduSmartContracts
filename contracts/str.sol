//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Str{
     bytes text="RAYUDU";
  function get() public view returns(bytes memory){
    return text;
  }
}