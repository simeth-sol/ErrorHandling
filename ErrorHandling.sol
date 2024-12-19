// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingExample {
    uint256 public data;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Function using require: Ensure only the owner can update the data
    function updateData(uint256 newData) external {
        require(msg.sender == owner, "Only the owner can update the data");
        data = newData;
    }

    // Function using revert: Conditionally prevent state changes if criteria aren't met
    function restrictedAction(uint256 newData) external {
        if (msg.sender != owner) {
            revert("You are not authorized to perform this action");
        }
        data = newData;
    }

    // Function using assert: Check for invariants or conditions that should never occur
    function alwaysTrueInvariant(uint256 newValue) external {
        // Example invariant: New value should always be less than a specific upper limit
        uint256 upperLimit = 1000;

        // `assert` should only be used for conditions that should always be true
        assert(newValue < upperLimit);
        data = newValue;
    }
}
