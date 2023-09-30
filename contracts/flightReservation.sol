//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract FlightBooking{

    address public owner;
   // uint seatNumber;

    struct Booking{
        //address passenger;
        address owner;
        uint ticketPrice;
        uint availableTickets;
        //uint seatNumber;
        bool isPaid;
        bool isConfirmed;
        uint flightStatus;      // 0 available  1 notAvailable
    }

    struct Pay{
        bool pay;
    }

    //Booking[] book;
    
    mapping(uint => Booking) public booking;
    mapping(address => bool) public authorizedStaff;
    mapping(address => uint) public balances;
    mapping(uint => mapping(address => Booking))  payment;
    mapping(uint => mapping(uint => bool)) seatAvailability;  // for seat
    mapping(uint => mapping(uint => Pay)) seat;
   
   enum seatStatus{
       Available,   //0
       Booked   //1
   }
   seatStatus public status;
    constructor(){
        owner = msg.sender;
       // seatNumber = _seatNumber;
    }
    modifier onlyOwner(){
        require(owner == msg.sender ,"You are not the Owner");
        _;
    }

    function addAuthorizedStaff(address staff) public {
      authorizedStaff[staff] = true;
    }

    function addBalances() public returns(uint) {
        balances[msg.sender]+= 50000;
        return balances[msg.sender];
    }

    function addFlight(uint flightNumber,uint _ticketPrice,uint _availableTickets) public {
        require(authorizedStaff[msg.sender] == true,"Not the Authorized Staff");
        booking[flightNumber].flightStatus = 0;  //available
        booking[flightNumber].availableTickets = _availableTickets;
        booking[flightNumber].ticketPrice = _ticketPrice;
    }
    
    function requestBooking(uint flightNumber,uint seatNumber) public view {
     //booking[flightNumber].owner = msg.sender;
     require(booking[flightNumber].flightStatus == 0,"Flight is not Available");  // 0 available
     //status = seatStatus.Available;
      require(seatAvailability[flightNumber][seatNumber] == false,"Seat already Booked");  // available
      require(booking[flightNumber].availableTickets >= 1,"Sorry! No enough tickets available to book");
      //require(balances[msg.sender] > booking[flightNumber].ticketPrice * numberOfTickets,"Not enough balance");
     // require(balances[msg.sender] > booking[flightNumber].ticketPrice,"Insufficient Funds");
    }
    
    function getRemainingTickets(uint flightNumber) public view returns(uint){
        return booking[flightNumber].availableTickets;
    }

    function makePayment(address add,uint flightNumber,uint numberOfTickets,uint seatNumber) public payable{
      require(seatAvailability[flightNumber][seatNumber] == false,"Seat already Booked");  // available
      // require(seatAvailability[flightNumber][seatNumber] == 0,"Seat not Booked");
      //status = seatStatus.Booked;
      require(numberOfTickets == 1,"Book only one Ticket");
      require(balances[msg.sender] > booking[flightNumber].ticketPrice * numberOfTickets,"Not enough balance");
      uint k = booking[flightNumber].ticketPrice * numberOfTickets;
      booking[flightNumber].availableTickets -= numberOfTickets;
      balances[msg.sender] -= k;
      seat[flightNumber][seatNumber].pay = true;
      require(!payment[flightNumber][add].isPaid, "Booking already completed");
       //balances[msg.sender] -= booking[flightNumber].ticketPrice;  
       booking[flightNumber].isPaid = true;
       seatAvailability[flightNumber][seatNumber] = true;  //booked
       //payment[flightNumber][add].isPaid = true;
    }
    
    function confirmBooking(uint flightNumber) public {
        require(booking[flightNumber].isPaid,"Payment not Completed");
        booking[flightNumber].isConfirmed = true;
    }

    function cancelTicket(address add,uint flightNumber,uint seatNumber,uint numberOfTickets) public onlyOwner() {
       require(seat[flightNumber][seatNumber].pay == true, "Payment not yet done");
       require(seatAvailability[flightNumber][seatNumber] == true,"Seat not Booked");  // true booked
      // require(booking[flightNumber].status == 1,"Seat not Booked");
       require(numberOfTickets == 1,"Cancel one Ticket");
       balances[add] += booking[flightNumber].ticketPrice * numberOfTickets;
       booking[flightNumber].availableTickets += numberOfTickets;
       seat[flightNumber][seatNumber].pay = false;
       seatAvailability[flightNumber][seatNumber] = false;  //available
       booking[flightNumber].isPaid = false;
       booking[flightNumber].isConfirmed = false;
    }
    
  //  function checkSeatAvailability(uint flightNumber,uint seatNumber) public onlyOwner{
     //   seatAvailability[flightNumber][seatNumber] = 1;  //booked seat
   // }

   // function checkseat(uint seatNumber,uint flightNumber) public onlyOwner{
   //     seatAvailability[flightNumber][seatNumber] = 0;  //available seat
   // }
    function checkFlightAvailable(uint flightNumber) public {
        require(authorizedStaff[msg.sender] == true,"You are not the Authorized Staff");
        booking[flightNumber].flightStatus = 0; //available flight

    }

    function checkFlightCancelled(uint flightNumber) public {
       require(authorizedStaff[msg.sender] == true,"You are not the Authorized Staff");
        booking[flightNumber].flightStatus = 1; //cancelled flight
    }



}