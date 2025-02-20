// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

import '../interfaces/IReactive.sol';
import '../interfaces/ISystemContract.sol';
import './AbstractPayer.sol';

/// @title Abstract base contract for reactive contracts.
abstract contract AbstractReactive is IReactive, AbstractPayer {
    uint256 internal constant REACTIVE_IGNORE = 0xa65f96fc951c35ead38878e0f0b7a3c744a6f5ccc1476b313353ce31712313ad;
    ISystemContract internal constant SERVICE_ADDR = ISystemContract(payable(0x0000000000000000000000000000000000fffFfF));

    /// @notice Indicates whether this is a ReactVM instance of the contract.
    bool internal vm;

    ISystemContract internal service;

    constructor() {
        vendor = service = SERVICE_ADDR;
        addAuthorizedSender(address(SERVICE_ADDR));
        detectVm();
    }

    modifier rnOnly() {
        require(!vm, 'Reactive Network only');
        _;
    }

    modifier vmOnly() {
        require(vm, 'VM only');
        _;
    }

    /// @notice Determines whether this copy of the contract is deployed to an RVM or the top-level Reactive Network by checking for the presence of the system contract at the predetermined address.
    function detectVm() internal {
        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(0x0000000000000000000000000000000000fffFfF) }
        vm = size == 0;
    }
}
