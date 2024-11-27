// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

function getSystemContractImpl() returns (address) {
    (bool success, bytes memory ret) = address(0x64).call(abi.encode(block.number));
    require(success && ret.length == 0x20, 'Failure');
    return abi.decode(ret, (address));
}
