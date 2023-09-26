// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertificationVerification {
    address public owner;

    mapping(address => string) public certifications;
    mapping(address => bool) public isCertified;

    event CertificationIssued(address indexed recipient, string name, string description);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    function issueCertification(address recipient, string memory name, string memory description) public onlyOwner {
        require(!isCertified[recipient], "Certification already issued for this address");

        certifications[recipient] = string(abi.encodePacked(name, " - ", description));
        isCertified[recipient] = true;

        emit CertificationIssued(recipient, name, description);
    }

    function verifyCertification(address recipient) public view returns (string memory) {
        require(isCertified[recipient], "No certification found for this address");
        return certifications[recipient];
    }
}
