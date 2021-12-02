// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract Counter {

    uint256 count;
    address public factory;
    address public owner;

    constructor(address _owner) {
        owner = _owner;
        factory = msg.sender;
    }

    function getCount(address _caller) public view onlyOwner(_caller) returns (uint256) {
        return count;
    }

    function increment(address _caller) public onlyFactory onlyOwner(_caller) {
        count = count + 1;
    }

    modifier onlyOwner(address _caller) {
        require(_caller == owner, "Aufruf nur von Owner moeglich");
        _;
    }

    modifier onlyFactory() {
        require(msg.sender == factory, "Factory notwendig");
        _;
    }

}