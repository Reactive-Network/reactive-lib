// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

/// @notice Gets the current implementation address of the system contract by calling the node's custom function on address `0x64`.
/// @return The address of the current implementation of the system contract.
function getSystemContractImpl() returns (address) {
    (bool success, bytes memory ret) = address(0x64).call(abi.encode(block.number));
    require(success && ret.length == 0x20, 'Failure');
    return abi.decode(ret, (address));
}
