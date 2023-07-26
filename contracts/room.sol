//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract RoomBooking{
    address public owner;
    enum Status{
        Available, Booked   //By default room is AVailable
    }
    Status public status;
    struct Room{
        uint roomno;
        string name;   //person name
        uint date;
    }
    mapping(address => Room ) public Roombooking;
    modifier OnlyOwner() {
        owner = msg.sender;
        _;
    }
    function addRoom(address _roomAddress, uint _roomno) public OnlyOwner{
        Roombooking[_roomAddress].roomno = _roomno;

    }
    function bookRoom(address roomAddress, string memory _name, uint _roomno, uint _date) public {
        require(status == Status.Available, "Sorry! The room is Booked");
        Roombooking[roomAddress].name = _name;
        Roombooking[roomAddress].roomno = _roomno;
        Roombooking[roomAddress].date = _date;
        status = Status.Booked;
    }
    function cancelBooking(address _roomAddress) public{
         delete Roombooking[_roomAddress].roomno;
         delete Roombooking[_roomAddress].name;
         delete Roombooking[_roomAddress].date;
         status = Status.Available;
    }

}