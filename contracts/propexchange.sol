//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Property{
    address public contractowner;  //state
    uint maxLand;
    uint maxAnnualIncome;
    constructor(uint _maxLand,uint _maxAnnualIncome){
        contractowner = msg.sender;
        maxLand = _maxLand;
        maxAnnualIncome = _maxAnnualIncome;
    }
    modifier OnlyOwner(){
        require(contractowner == msg.sender, "Not the owner");
        _;
    }
    struct Land{
        string  name;
        uint totalLand;
        uint annualIncome;
        string owner;
    }
    mapping(address => Land) public property;
    function set(address _add,string memory _name,string memory _owner, uint annualIncome,uint totalLand) public{
        property[_add].name = _name;
        property[_add].owner= _owner;
        property[_add].annualIncome = annualIncome;
        property[_add].totalLand = totalLand;
    }
    function get(address _add) public  view returns(string memory _name,string memory _owner,uint _annualIncome,uint _totalLand){
        return(property[_add].name,
        property[_add].owner,
        property[_add].annualIncome,
        property[_add].totalLand
        );
    }
    function buyLand(address _add,uint _land) public {
        property[_add].totalLand += _land;
       // property[_add].annualIncome += _annualIncome;
    }
    function transfer(address _add,address _to,uint _land,uint _income,string memory _newname) public{
        require(property[_add].totalLand > _land, "You have no sufficient land to transfer");
        property[_add].totalLand -= _land;
        property[_to].totalLand += _land;
         property[_add].owner = _newname;
        property[_add].annualIncome -= _income;
        
        
    }
    function eligible(address _add) public view returns(string memory){
         if(property[_add].totalLand <= maxLand){  //"Your Land is greater than required");
             if(property[_add].annualIncome <= maxAnnualIncome){ //"Your income is greater than maxAnnualincome");
                  return ("Your are Eligible");
             }
             else {
                 return "Your income is greater than required, You are not Eligible";
             }

         }
         else 
         {
             return "Your land is greater than required, You are not Eligible";
         }
    }

}