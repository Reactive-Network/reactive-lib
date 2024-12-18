// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

import './IPayer.sol';

// @title Interface for reactive contracts.
// @notice Reactive contracts receive notifications about new events matching the criteria of their event subscriptions.
interface IReactive is IPayer {
    event Callback(
        uint256 indexed chain_id,
        address indexed _contract,
        uint64 indexed gas_limit,
        bytes payload
    );

    // @notice Entry point for handling new event notifications.
    // @param chain_id EIP155 source chain ID for the event (as a `uint256`).
    // @param _contract Address of the originating contract for the received event.
    // @param topic_0 Topic 0 of the event (or `0` for `LOG0`).
    // @param topic_1 Topic 1 of the event (or `0` for `LOG0` and `LOG1`).
    // @param topic_2 Topic 2 of the event (or `0` for `LOG0` .. `LOG2`).
    // @param topic_3 Topic 3 of the event (or `0` for `LOG0` .. `LOG3`).
    // @param data Event data as a byte array.
    // @param block_number Block number where the log record is located in its chain of origin.
    // @param op_code Number of topics in the log record (0 to 4).
    // @param origin_block_hash Origin block hash associated with the log record.
    // @param origin_tx_hash Origin transaction hash associated with the log record.
    // @param log_index Received log record's index.
    function react(
        uint256 chain_id,
        address _contract,
        uint256 topic_0,
        uint256 topic_1,
        uint256 topic_2,
        uint256 topic_3,
        bytes calldata data,
        uint256 block_number,
        uint256 op_code,
        uint256 origin_block_hash,
        uint256 origin_tx_hash,
        uint256 log_index
    ) external;
}
