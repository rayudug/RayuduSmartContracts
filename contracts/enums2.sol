//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Enums{

    enum Status{
        pending,   //0   by default it is 0 (i.e. pending)
        accepted,  //1
        canceled,  //2
        rejected   //3
    }
    Status status;
    function getStatus() public view returns(Status){
       return status;
    }
    
    function setStatus(Status _status) public { //we pass uint to function as input
               status = Status(_status);
    }
    
    function canceledStatus() public{
        status = Status.canceled;
    }

    function acceptedStatus() public{
        status = Status.accepted;
    }

    function resetStatus() public{
        delete status;
    }
} 