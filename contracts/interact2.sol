//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

interface IData {
  function getAge() external pure returns(uint);
  function getHeight() external pure returns(uint);
  function getName() external pure returns(string memory);
  function getCar() external pure returns(string memory);
}


contract MainContract {

    function getAge() external pure returns(uint) {
        return IData(0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3).getAge();
  }
  
    function getHeight() external pure returns(uint) {
        return IData(0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3).getHeight();
  }
  
    function getName() external pure returns(string memory) {
        return IData(0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3).getName();
  } 
}