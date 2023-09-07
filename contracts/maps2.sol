//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Maps{
      address public owner;
      constructor() {
          owner = msg.sender;
      }
      modifier OnlyOwner(){
          require(msg.sender == owner);
          _;
      }
      struct Amazon{
          uint id;
          uint price;
          string productName;
          string name;
      }
      mapping(address =>Amazon) public mymap;
      function set(address _addr,string memory _name,uint _id,uint price,string memory _productName)public OnlyOwner{
           mymap[_addr].id = _id;
           mymap[_addr].name = _name;
           mymap[_addr].price = price;
           mymap[_addr].productName = _productName;
      }

      function get(address _addr) public view returns(uint id,string memory name,string memory productName,uint price) {
          return (
              mymap[_addr].id,
              mymap[_addr].name,
              mymap[_addr].productName,
              mymap[_addr].price
          );
      }
}