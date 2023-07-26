//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Crops{
    address public farmer;
    modifier OnlyFarmer(){
        require(msg.sender == farmer,"Only farmer has to update");
        _;
    }
    constructor(){
        farmer = msg.sender;
    }
    struct Farmer{
        string farmlocation;
        string cropname;
        uint area;
    }
    mapping(address =>mapping(uint => Farmer)) public crops;  
    event FarmRegistering(address owner, string _cropname,string farmlocation,uint area);
    function register(address _add,uint _id,string memory _farmlocation,string memory _cropname,uint _area) external OnlyFarmer {
        require(bytes(_cropname).length > 0, "Crop name should not be empty");
        require(bytes(_farmlocation).length > 0, "Location should be specified");
        require(_area > 0, "Area should be greater than zero");
        require(_id > 0,"ID is required");
        crops[_add][_id].farmlocation = _farmlocation;
        crops[_add][_id].cropname = _cropname;
        crops[_add][_id].area = _area;
        emit FarmRegistering(_add,_cropname,_farmlocation,_area);
    }
    function updateCrops(address _add,uint _id,string memory _cropname, string memory _farmlocation,uint _area) public {
        crops[_add][_id].cropname = _cropname;
        crops[_add][_id].area = _area;
        crops[_add][_id].farmlocation = _farmlocation;
    }

}