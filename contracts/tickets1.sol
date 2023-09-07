//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Tickets{
     address public owner;
    constructor() {
        owner= msg.sender;
    }

    struct Ticket{
        uint id;
        string name;
        uint age;
        uint seat;
    }
    
   mapping(uint => Ticket) public map;
   function addTicket(uint _id,string memory _name,uint _age,uint _seat) public{
      map[_id].id=_id;
      map[_id].name=_name;
      map[_id].age=_age;
      map[_id].seat=_seat;
   }

   function get(uint _id) public view returns(string memory name,uint age,uint seat){
       return(
           map[_id].name,
           map[_id].age,
           map[_id].seat
       );
   }

}