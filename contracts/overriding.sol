//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Shape{
    function getArea() public view virtual returns(uint){
        //return true;
    }
}
contract Square is Shape{
    uint side;
    constructor(uint _side){
        side = _side;

    }
    function getArea() public view override returns(uint){ //overriding parent function
          return (side *side);
    }
}
contract Circle is Shape{
    uint radius; //state variable
    constructor(uint _radius){
        radius = _radius;
    }
    function getArea() public view override returns(uint){
        return(22 * radius * radius)/7;
    }
}