//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Enums{

    enum Item{
       delivery,
       shipped,
       cancel,
       accepted,
       rejected
    }

    Item item;
    function get(Item it) public {
        item = it;
    }
    function accept() public{
        item = Item.accepted;
    }
    function ship() public{
        item = Item.shipped;
    }

    function getStatus() public view returns(Item){
        return item;
    }
}