//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
  //VISIBILITY :-
    //Public - can be used at anywhere and at any contract
    //private - can be used within the contract
    //internal - can be used within the contract and in the child contracts
    //external - can be used in other contracts only.

    /*
      contract A{
          function pub() public
          function inter() internal
          function pri() private
          function ext() external   
         }
    contract B is A{   //B is child of A
        inter()
        pub()
    }
    
    contract C{
        pub()
        ext()
    }
 */

contract A{
    uint public x = 0;
    uint private y=1;
    uint internal z = 2;
    function pub() public view virtual returns(uint){
       return x+y+z;
    }
    function inter() internal view virtual returns(uint){
        return x*y*z;
    }
    function pri() private view returns(uint){
        return y + z -x;
    }
    function ex() external view virtual returns(uint){
        return(x+y+z);
       

    }
    function ext() external view{
        pub();
        pri();
        inter();
        this.ex();

    }
}

contract B is A{
    function pub() public view override(A) returns(uint){
        return x+z;
    }
    function inter() internal view override(A) returns(uint){
        return z*1;
    }
    function ex() external view override(A)  returns(uint){
        return x*0;
    }

}