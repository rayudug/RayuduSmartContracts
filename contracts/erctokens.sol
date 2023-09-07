//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Tokens{
    string public constant name = "ERC20";
    string public constant symbol = "ERC";
    uint decimals = 12;
    uint tokens;
    address public owner;
    modifier onlyOwner(){
        require(owner == msg.sender);
        _;
    }
    uint totalsupply;
    constructor() {
        owner = msg.sender;   
    }
    mapping(address => uint) public balances;
    mapping (address => mapping(uint => uint)) public allowances;
    function balanceof(address _add) public view returns(uint){
        return balances[_add];
    }
    event Transfer(address _to,uint numberofTokens);
   function transfer(address _from,address _to,uint numberofTokens) public  {
     require(_from !=address(0),"Invalid address");
      require(_to !=address(0),"Invalid address");
       balances[_from] -= numberofTokens;
      balances[_to] += numberofTokens;
      emit Transfer(_to,numberofTokens);
   }
   event Receive(address to,uint tokens);
   function Recieve(address _to,uint totalTokens) public {
      require(_to !=address(0),"Invalid address");
      balances[msg.sender] += totalTokens;
      emit Receive( msg.sender,tokens);
   }
   function time() public view returns(uint){
       return block.timestamp;
   }
   
}