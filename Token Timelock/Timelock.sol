// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

contract Timelock {
    // who can withdraw?
    // when? 
    // how much?
    // https://www.unixtimestamp.com/

    address payable public beneficiary;
    uint256 public releaseTime;

    constructor(
        address payable _beneficiary,
        uint256 _releaseTime
    )
        payable
    {
        require(_releaseTime > block.timestamp);
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    function release() public {
        require(block.timestamp >= releaseTime);
        (beneficiary).transfer(address(this).balance);
    }
}
