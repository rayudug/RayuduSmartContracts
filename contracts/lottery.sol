//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Lottery{
    address public manager;
    address payable[] team;
    address payable public winner;
    uint startTime;
    uint endTime;
    enum LotteryState{
        closed,
        open
    }
    LotteryState public lotterystate;
    constructor(uint _startTime,uint _endTime){
        manager = msg.sender;
        lotterystate = LotteryState.closed;
        startTime = _startTime;
        endTime = _endTime;
    }
    modifier onlyManager(){
        require(manager == msg.sender,"Your are not the manager");
        _;
    }
    function participate() public payable{
       require(startTime < endTime, "Lottery period has Ended");
       require(msg.value >= 2 ether, "Pay atleast two ethers");
       lotterystate = LotteryState.open;
       team.push(payable(msg.sender));
    }
    function getBalance() public view onlyManager()returns(uint){
        return address(this).balance;
    }
    function getWinner() public returns(address) {
        require(startTime < endTime, "Lottery period has Ended");
        require(team.length >= 3,"Players should not be less than THREE");
        uint k = uint(keccak256(abi.encodePacked(block.timestamp,team.length)));
        uint t = k % team.length;
        winner = team[t];
        lotterystate = LotteryState.closed;
        return winner;
    }
    function getLotteryAmount() public{
        return winner.transfer(getBalance());
    }

}