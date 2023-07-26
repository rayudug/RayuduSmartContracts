//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Voting{
    address public admin;
    struct Proposals{  // parties
        string name;  //party name
        uint voteCount;  //party vote count
    }
    Proposals[] public proposal;
    modifier onlyAdmin(){
        require(admin == msg.sender, "Not the admin");
        _;
    }
    mapping(address => bool) public voted;
    constructor(string[] memory proposalsNames){
        admin = msg.sender;
        for(uint i=0;i<proposalsNames.length;i++){
         proposal.push(Proposals({name : proposalsNames[i], voteCount : 0}));
        }
    }
    function voteProposal(address _add,uint proposalIndex) public{
        require(proposalIndex < proposal.length ,"Voting to Invalid proposal"); 
        require(!voted[_add],"You already voted");
        voted[_add] = true;
        proposal[proposalIndex].voteCount++;
    }
    function getproposalCount() public view returns(uint){
        return proposal.length;
    }
    function addproposal(string memory _name) public{
        proposal.push(Proposals({name : _name, voteCount :0}));
    }
   function removeproposal(uint proposalIndex) public{
       require(proposalIndex < proposal.length,"Invalid proposalIndex");
       delete proposal[proposalIndex];
   }
   function count(uint proposalIndex) public view returns(uint){
     return proposal[proposalIndex].voteCount;
   }




}