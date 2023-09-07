//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Vehicle{
    uint count;
    struct Register{
        string ownerName;
        string ownerLocation;
        uint ownerAadhar;
        bool status;
    }
    struct vehicle{
        uint count;
        string vehicleCondition;
        string driverName;
        string driverAddres;
        string insurerCompany;
        string insurerBranch;
        uint insuranceId;
        string validity;
        string owner;
        string vehicleStatus;
    }
    struct accident{
        string policeName;
        string policeBranch;
        uint vehicleId;
        string driverName;
        string driverAddress;
        string witnessName;
        string vehicleStatus;
    }
    struct Unregistered{
        uint id;
        string ownerName;
        string policeName;
    }
    struct Insurance{
        string name;
        bool check;
    }
    mapping(uint => Register)  registered;
    mapping(uint => vehicle)  vehicleRepair;
    mapping (uint => accident)  policeReport;
    mapping (uint => Unregistered)  police;
    mapping(address => uint)  balances;
    mapping(uint => Insurance) public insurance;

    function newVehicleRegister(uint _id,string memory _ownerName,uint _aadhar,string memory _ownerLocation) public {
     registered[_id].ownerName = _ownerName;
     registered[_id].ownerLocation = _ownerLocation;
     registered[_id]. ownerAadhar = _aadhar;
    registered[_id].status = true;
    }
    function accidentVehicle(uint _id,string memory _driverName,string memory _driverAddres,string memory _insurerCompany,string memory _insurerBranch,uint _insuranceId,string memory _validity,string memory _owner) public  {
        require(registered[_id].status == true, "Register Vehicle,It is not Registered");
        vehicleRepair[_id].driverName = _driverName;
         vehicleRepair[_id].driverAddres = _driverAddres;
         vehicleRepair[_id].insurerCompany = _insurerCompany;
         vehicleRepair[_id].insurerBranch = _insurerBranch;
         vehicleRepair[_id].insuranceId = _insuranceId;
         vehicleRepair[_id].validity = _validity;
         vehicleRepair[_id].owner = _owner;
         vehicleRepair[_id].count++;
    }
    function Police(uint _id,string memory _policeName,string memory _policeBranch,string memory _driverAddress,string memory _driverName,string memory _witnessName) public returns(string memory vehicleStatus){
        policeReport[_id].policeName = _policeName;
        policeReport[_id].policeBranch = _policeBranch;
        policeReport[_id].driverName = _driverName;
        policeReport[_id].driverAddress = _driverAddress;
        policeReport[_id].witnessName = _witnessName;
        return(policeReport[_id].vehicleStatus = "Damaged");
    }
    //function unRegisteredVehicles(uint _id,string memory _ownerName,string memory _policeName) public returns(string memory) {
    //    require(registered[_id].status == false, "Vehicle Registered");
      //   police[_id].ownerName = _ownerName;
       //  police[_id].policeName = _policeName;
        // return "Vehicle Seized";
    //}
    function getTotalCases(uint _id) public view returns(uint){
        return (vehicleRepair[_id].count);
    }
    function INSURANCE(uint _id,string calldata _ownerName) public{
     require(registered[_id].status == true, "Vehicle is not Registered");
      insurance[_id].name = _ownerName;
      insurance[_id].check = true;
    }
    function InsuranceCheck(uint _id,address _add,uint Amount,uint nowDate,uint expiryDate) public returns(string memory) {
         require(nowDate <= expiryDate, "Insurance is Expired");
         require(insurance[_id].check == true,"Sorry! This Vehicle has no Insurance in our company");
         balances[_add] += Amount;
        return "Insurance is Valid";
    }
    function getBalance(address _add) public view returns(uint){
        return balances[_add];
    }
}



