// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

import '../interfaces/IPayer.sol';
import '../interfaces/IPayable.sol';

abstract contract AbstractPayer is IPayer {
    IPayable internal vendor;

    mapping(address => bool) senders;

    constructor() {
    }

    receive() virtual external payable {
    }

    modifier authorizedSenderOnly() {
        require(senders[msg.sender], 'Authorized sender only');
        _;
    }

    function pay(uint256 amount) external authorizedSenderOnly {
        _pay(payable(msg.sender), amount);
    }

    function coverDebt() external {
        uint256 amount = vendor.debt(address(this));
        _pay(payable(vendor), amount);
    }

    function _pay(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, 'Insufficient funds');
        if (amount > 0) {
            (bool success,) = payable(recipient).call{value: amount}(new bytes(0));
            require(success, 'Transfer failed');
        }
    }

    function addAuthorizedSender(address sender) internal {
        senders[sender] = true;
    }
    function removeAuthorizedSender(address sender) internal {
        senders[sender] = false;
    }
}
