//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Data{
    function getAge() external pure returns(uint){
        return 25;
    }
    function getheight() external pure returns(uint){
        return 180;
    }
    function getName() external pure returns(string memory){
        return "RAYUDU";
    }
    

}