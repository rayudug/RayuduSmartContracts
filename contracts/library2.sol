//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Library{
    address public owner;
       constructor() {
        owner=msg.sender;
    }
    modifier OnlyOwner(){
        require(owner == msg.sender, "Not the owner");
        _;
    }

    struct Book{
        uint id;
        string name;
        //string author;
        //uint price;
    }

    mapping(uint => Book) public books;

    function addbooks(uint _id,string memory _name) public OnlyOwner{
          books[_id].id=_id;
          books[_id].name=_name;
          //books[_id].author=_author;
         // books[_id].name=_name;
          //books[_id].price=_price;
    }

    function get(uint _id) public view returns(string memory _name) {
        return books[_id].name;
           // books[_id].author,
           // books[_id].price
    }

    function remove(uint _id) public{
        delete books[_id].name;
       // delete books[_id].author;
        
    }



}