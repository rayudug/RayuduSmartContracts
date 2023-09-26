// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Library{
    address public libraryowner;
    constructor() public{
        libraryowner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender==libraryowner);
        _;
    }
    struct Book{
        uint256 id;
        string name;
        string author;
        uint256 value;
    }
    mapping (uint256=>Book) public books;
    function addBook(
        uint256 _bookid,
        string memory _name,
        string memory _author,
        uint256 _value
    ) public onlyOwner{
        books[_bookid].name=_name;
        books[_bookid].author=_author;
        books[_bookid].value=_value;
    }
    function queryBook(uint256 _bookid)
    public view returns(
        string memory _name,
        string memory _author,
        uint256 _value
    )
    {
       return(
         books[_bookid].name,
         books[_bookid].author,
         books[_bookid].value
       );
    }
    
}
