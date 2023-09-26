//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Railway{
    address owner;
    struct Train{
        //uint trainNo;
        uint availableSeats;
        string source;
        string destination;
        uint fare;
        bool isRunning;
    }
    enum trainStatus{
        NotBooked,
        returning,
        refunded
    }
    trainStatus public status;
    mapping(uint => Train) public train;    //trainNo to Train
    mapping(address => uint) public balances;
    Train[] trains;
    //function getTrain(uint trainNo) public {
    //  train[trainNo].availableSeats = 250;
    //}
    function getBalance() public returns(uint){
         balances[msg.sender]+= 5000;
         return balances[msg.sender];
    }
   function searchTrains(string memory source,string memory destination) public view returns(Train[] memory){
       Train[] memory output = new Train[](trains.length);
       uint j;
      for (uint256 i = 0; i < trains.length; i++) {
            if (isTrainAvailable(source,destination)) 
            {
                output[j++] = trains[i];
            }
        }
        return output;
   }
   function isTrainAvailable(string memory passengerSource,string memory passengerDestination) public pure returns(bool){
        return
        keccak256(abi.encodePacked(passengerSource)) != keccak256(abi.encodePacked(passengerDestination));
   }
   event Booked(uint trainNo,address passenger);
   function trainUpdate(uint _trainNo,uint _availableSeats,string memory _source,string memory _destination,uint _fare)public{
    train[_trainNo].availableSeats = _availableSeats;
    train[_trainNo].source = _source;
    train[_trainNo].destination = _destination;
    train[_trainNo].fare = _fare;
    train[_trainNo].isRunning = true;
   }
   function bookTickets(uint trainNo,address add) public payable returns(uint){
       require(train[trainNo].isRunning == true,"Train is not Running");
       require(balances[add] > train[trainNo].fare, "Insufficient funds");
       //require(train[trainNo].availableSeats >  ,"No Available Seats");
       train[trainNo].availableSeats--;
       balances[msg.sender]-= train[trainNo].fare;
       emit Booked(trainNo,msg.sender);
       return train[trainNo].availableSeats;
   }
   function addTrain(uint trainNo,uint availableSeats,string memory source,string memory destination,uint Fare) public{
       trains.push(Train(availableSeats,source,destination,Fare,true)
       );
       train[trainNo].isRunning = true;

   }
   function cancelTicket(uint trainNo,address _add) public returns(string memory) {
       train[trainNo].availableSeats++;
       balances[_add]+= train[trainNo].fare;
       status = trainStatus.refunded;
       return "Ticket Cancelled Successfully";
   }
   
}