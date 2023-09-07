//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Tokens{
    string public constant name = "ERC20";
    string public constant symbol = "ERC";
    uint tokens;
    address public owner;
    modifier onlyOwner(){
        require(owner == msg.sender);
        _;
    }
    constructor() {
        owner = msg.sender;  
    }
    struct StructTokens{
        uint tokenid;
        bool tokenStatus;
    }
    mapping(address => uint) public balances;
    mapping(uint256 => uint256) tokenexpiry;  //tokenId and ExpiryDate
   mapping(string => StructTokens) public createToken;

   function getBalance(address _add) public view returns(uint){
     return balances[_add];
   }

   function createNewToken(uint _tokenid,string memory _tokenSymbol) public {
       createToken[_tokenSymbol].tokenid = _tokenid;
       createToken[_tokenSymbol].tokenStatus = true;
   }
    event Transfer(address _to,uint numberofTokens);
   function transfer(uint tokenId,uint nowdate,uint expirytime,string memory _tokenSymbol,address _from,address _to,uint numberofTokens) public{
     require(_from !=address(0),"Invalid address");
      require(_to !=address(0),"Invalid address");
      require(createToken[_tokenSymbol].tokenStatus == true,"Token has not created");
      tokenexpiry[tokenId] = expirytime;  //setting expiry time to a token
      require(numberofTokens <= balances[_from],"No sufficient balance in the account");
      if( nowdate < expirytime )
      {
      balances[_from] -= numberofTokens;
      balances[_to] += numberofTokens;
      }
      else {
          balances[_from]-= numberofTokens;
      }
     createToken[_tokenSymbol].tokenStatus = false;
      emit Transfer(_to,numberofTokens);
   }
   event Receive(address to,uint tokens);
   function Recieve(uint expirytime,uint nowdate,uint tokenId,string memory _tokenSymbol,address _to,uint totalTokens) public {
      require(_to !=address(0),"Invalid address");
      require(createToken[_tokenSymbol].tokenStatus == true,"Token has not created");
      tokenexpiry[tokenId] = expirytime;  //setting expiry time to a token
       require( nowdate < expirytime,"Sorry! Token has expired");
      balances[_to] += totalTokens;
      emit Receive( _to,tokens);
   }
  
}