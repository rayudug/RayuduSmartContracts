//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract TicketsBooking{

    uint public ticketPrice;   //state variable
    uint public numberOfTickets;
    uint public totalAmountForTickets;
    uint public GST;
    uint  public age;
    string public message = "Buy Your Tickets";

    constructor(uint256 _ticketPrice,uint _age) {
        ticketPrice = _ticketPrice;
        age = _age;
    }
    
    function buyTickets()  public{
      numberOfTickets +=1;
    }
     
     function addGST() public{
         if(age > 15)
            GST = 50;
        else 
          GST = 20;
     }
    function Tickets() public returns(uint){
        //ticketPrice = _ticketPrice;
       totalAmountForTickets = numberOfTickets * (ticketPrice + GST); 
       return totalAmountForTickets;
    }
}