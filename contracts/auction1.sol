//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Bidding{
    //address payable owner;
    address public highestbidder;
   // uint public highestamount;
    uint bidEndTime;
    bool auctionEnded;
    mapping (address => uint) public bid;

    event bidcompleted(address winner,uint amount);
    error AuctionHasEnded();
   // error InsufficientBid();
    constructor(uint biddingTime){
     bidEndTime  = block.timestamp + biddingTime;
    }
    address payable bidder;
    function bidding(uint highestamount,uint _amount) public {
      if(block.timestamp > bidEndTime){
          revert AuctionHasEnded();
      }
      bidder = payable(msg.sender);
      require(highestamount != _amount,"Amount should be higher");
      require(_amount > 0, "Amount should not be Zero");
      if(highestamount < _amount){
          highestamount = _amount;
          highestbidder = bidder;
         bid[highestbidder] += _amount;
      }
     
      highestbidder = bidder;
       auctionEnded = true;
       emit bidcompleted(highestbidder,highestamount);
    }
    function getHighestBidder() public view returns(address){
        return highestbidder;
    }

}