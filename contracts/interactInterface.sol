//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

interface IInterface{
    function setName(string memory _name) external;
    function getName() external view returns(string memory);
}
contract AccessInterface{
    function callsetName() public {
        IInterface(0xd9145CCE52D386f254917e481eB44e9943F39138).setName("RAYUDU");
    }
    function callgetName() public view returns(string memory){
       return IInterface(0xd9145CCE52D386f254917e481eB44e9943F39138).getName();
    }
}