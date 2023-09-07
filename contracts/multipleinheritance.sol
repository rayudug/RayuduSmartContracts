//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract A{
    function info() public view virtual returns(string memory){    //info function acts as function polymorphism
        return "A";
    }
    function boo() public pure returns(string memory){
        return "Hello";
    }
}
contract B is A{   //derived contract from contract A
    function info() public pure override returns(string memory){
        return "hello";
    }
}

