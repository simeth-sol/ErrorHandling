Error handling describes the procedures used to deal with unforeseen circumstances or invalid states during the execution of smart contracts. Solidity offers resources for error detection and response to guarantee predictable and secure contract behavior.

require: This statement ensures a condition is true; otherwise, it reverts the transaction with an optional error message, commonly used for input validation, state conditions, or access control.

Example: Ensuring only the owner can update the data.

```
require(msg.sender == owner, "Only the owner can update the data");
```
revert: This statement is used to conditionally revert the transaction based on some logic. It is often used inside if statements for more complex condition checks. revert also provides an optional error message.

Example: Preventing unauthorized users from performing an action.

```
if (msg.sender != owner) {
    revert("You are not authorized to perform this action");
}
```
assert: This statement is used to check for conditions that should never occur. It is primarily used for internal error checking and invariants. If the condition fails, the transaction is reverted, and all gas is consumed.

Example: Ensuring a new value is within a specific range.

```
assert(newValue < upperLimit);
```
Deployment and Usage Deploy the contract using Remix, Hardhat, or any other Ethereum development framework. Interact with the contract using the deployed instance: Call updateData to update the data variable (only callable by the owner). Call restrictedAction to perform a restricted action (only callable by the owner). Call alwaysTrueInvariant to update the data variable within a specified range.
