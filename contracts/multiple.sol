//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
    contract A{
     function get() public view virtual returns(string memory){
         return "A";

     }
     function foo() public view virtual returns(string memory){
         return "This is contract A";
     }
    }

    contract B{
        function foo() public view virtual returns(string memory){
            return "B";
        }
    }

    contract C is A,B{
        function get() public pure  virtual override(A)  returns(string memory){
            return "AC";
        }
        function hey() public pure  virtual override()  returns(string memory){
            return "BC";
        }
    }

    contract D{
        function hey() public view virtual returns(string memory){
            return "D";
        }
    }

    contract E is C,D{
        function get() public pure override(C) returns(string memory){
            return "EC";
        }
        function hey() public pure override(D,C) returns(string memory){
            return "ED";
        }
    }


