// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

/// @title Common interface for the system contract and the callback proxy, allows contracts to check and pay their debts.
interface IPayable {
    /// @notice Allows contracts to pay their debts and resume subscriptions.
    receive() external payable;

    /// @notice Allows reactive contracts to check their outstanding debt.
    /// @param _contract Reactive contract's address.
    /// @return Reactive contract's current debt due to unpaid reactive transactions and/or callbacks.
    function debt(address _contract) external view returns (uint256);
}
