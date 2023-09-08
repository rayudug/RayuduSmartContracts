//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract School{
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner(){
    require(msg.sender == owner, "You are not the owner");
    _;
    }
    struct school{
        uint regno;
        string name;
        uint dateofbirth;
        uint class;
        bool status;
    }
    mapping(address => school) public studentData;
    function adddata(address _add,string memory _name,uint _regno,uint _dateofbirth,uint _class) public onlyOwner() {
            studentData[_add].name = _name;
            studentData[_add].regno = _regno;
            studentData[_add].dateofbirth = _dateofbirth;
            studentData[_add].class = _class;
            studentData[_add].status = true;
    }
    function editData(address _add,uint _regno,string memory _newName,uint _newBirth,uint _newClass) public onlyOwner(){
         studentData[_add].name = _newName;
            studentData[_add].regno = _regno;
            studentData[_add].dateofbirth = _newBirth;
            studentData[_add].class = _newClass;
    }
    function deleteData(address _add) public onlyOwner() {
        delete studentData[_add];
        studentData[_add].status = false;
    }
    function isregistered(address _add) public view returns(bool){
        return studentData[_add].status;
    }

}