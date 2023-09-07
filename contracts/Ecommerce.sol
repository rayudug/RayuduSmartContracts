//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract ECommerce{
      address owner;
      constructor(){
          owner = msg.sender;
      }
      modifier onlyOwner(){
          require(msg.sender == owner,"Not the Owner");
          _;
      }
      struct Ecommerce{
           string productName;
           uint price;
           uint rating;
           uint count;
           bool status;
      }
      mapping(uint => Ecommerce)  public product;
      function createProduct(string memory _productName,uint _price,uint _id) public{
        require(_id > 0,"Product Id should not be Zero");
        require(_price > 0,"Price of the product should be Greater than Zero");
        require(bytes(_productName).length > 0,"Product Name should not be Empty");
        product[_id].productName = _productName;
        product[_id].price = _price;
        product[_id].count++;
      }
      function purchaseProduct(uint _id,uint _price) public payable {
        require(msg.sender.balance >= _price,"Insufficient Balance");
         product[_id].status = true;

      }
      function Rating(uint _id,uint _rating) public returns(string memory){
        require(_rating >=1 && _rating <= 5,"Rating should be between 1 and 5");
        product[_id].rating = _rating;
        if(_rating >= 4){
          return ("Thank You so much");
        }
        else{
            return("Thank You so much, Is there anything that we need to Improve");
        }
      }
}