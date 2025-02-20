// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

import './IPayable.sol';
import './ISubscriptionService.sol';

/// @title Interface for the Reactive Network's system contract.
interface ISystemContract is IPayable, ISubscriptionService {
}
