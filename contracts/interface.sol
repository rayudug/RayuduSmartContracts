//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Interface{
    string Name;
    function setName(string memory _name) public {
        Name = _name;
    }
    function getName() public view returns(string memory){
        return Name;
    }
}