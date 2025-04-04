// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedArraySum {
    // Do not modify this
    uint256[] array;

    // Do not modify this
    function setArray(uint256[] memory _array) external {
        require(_array.length <= 10, 'too long');
        array = _array;
    }

    // optimize this function
    function getArraySum() external view returns (uint256) {
        uint256 sum;
        for (uint256 i = array.length; i > 0; i--) {
            sum += array[i - 1];
        }

        return sum;
    }
}

/* 1
         Current gas use:   23399
           The gas target is: 23396
           You are 3 above the target
           */
