//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Enums{
    enum Status{
        True,
        False
    }
    Status  public status;  
    function setStatus(Status _status) public {
        status = Status(_status);
        //return status;
    }
}