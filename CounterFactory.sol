// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "./Counter.sol";

contract CounterFactory {

    mapping(address => Counter) public addressToCounter;

    function CounterContract() public {
        require(address(addressToCounter[msg.sender]) == address(0x0));
        Counter counter = new Counter(msg.sender);
        addressToCounter[msg.sender] = counter;
    }

    function cfIncrement() public {
        require(address(addressToCounter[msg.sender]) != address(0x0));
        Counter(addressToCounter[msg.sender]).increment(msg.sender);
    }

    function cfGetCount(address _address) public view returns (uint256) {
        require(address(addressToCounter[msg.sender]) != address(0x0));
        return Counter(addressToCounter[_address]).getCount(msg.sender);
    }

    function cfGetMyCount() public view returns (uint256) {
        require(address(addressToCounter[msg.sender]) != address(0x0));
        return Counter(addressToCounter[msg.sender]).getCount(msg.sender);
    }
}