// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedRequire {
    // Do not modify these variables
    uint256 constant COOLDOWN = 0x3c; // equivalent to 1 minutes
    uint256 lastPurchaseTime = 0x1; // start with non zero value , just this --> 26284

    // Optimize this function
    function purchaseToken() external payable {
        assembly {
            if iszero(eq(callvalue(), 0x16345785d8a0000)) {
                revert(0, 0)
            }

            let lastPurchase := sload(lastPurchaseTime.slot)
            let blockTS := timestamp()

            if lt(blockTS, add(lastPurchase, COOLDOWN)) {
                revert(0, 'cannot purchase')
            }
            sstore(lastPurchaseTime.slot, blockTS)
        }
    }
}
