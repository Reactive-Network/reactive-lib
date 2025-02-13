// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

/// @title Common interface for the contracts that need to pay for system contract's or proxies' services.
interface IPayer {
    /// @notice Method called by the system contract and/or proxies when payment is due.
    /// @dev Make sure to check the msg.sender.
    /// @param amount Amount owed due to reactive transactions and/or callbacks.
    function pay(uint256 amount) external;

    /// @notice Allows the reactive contracts and callback contracts to receive funds for their operational expenses.
    receive() external payable;
}
