//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Enums{
    
    enum Button{    //enum named Button
        ON,
        OFF
    }
   Button button;   //variable of type enum
    function buttonOn() public {
        button=Button.ON;
    }
    function buttonOff() public{
        button=Button.OFF;
    }
    function getbuttonstate() public view returns(Button){
        return button;
    }
}