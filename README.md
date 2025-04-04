# [RareSkills](https://rareskills.io) Gas Puzzles

## Puzzles to solve

-   [X] Require (easy) " not so easy :) ... at least for me !
-   [ ] Vote (easy)
-   [ ] Array Sum (easy)
-   [ ] Security101 (easy/medium)
-   [ ] Array Sort (medium)
-   [ ] ERC165 (low level programming required)
-   [ ] Distribute (hard)
-   [ ] Mint150 (hard)

## Players

Your goal is to optimize the contracts such that they reach the target efficiency.

Rules

-   you may not change the optimizer level
-   you may not change the solidity version
-   you may refactor functionality as long as you don't break the business logic
-   you may make reasonable assumptions about what variable sizes are necessary to get things done
-   you may remove unnecessary or redundant logic (some have been intentionally added)
-   because making functions `payable` is a controversial optimization, you do not need to make functions `payable` to reach the gas target unless the function needs to be payable to fulfill its business logic

## Testing

As mentioned above, optimized contracts should be created in their own sub-folder
to prevent committing them publicly.

The file structure should look similar to this:

```
- GasPuzzles
  |_
    contracts
    |_
      contracts_optimized
    | |_
    |   ArraySum.sol
    |   Distribute.sol
    |   ..
    |   ...
    |
    ArraySum.sol
    Distribute.sol
    ..
    ...
```

Within the contracts that are optimized be sure to follow the following naming
convention to ensure tests run smoothly:

```
contract OptimizedArraySum {

...

contract OptimizedDistribute {

...
```

```
npx hardhat test
npx hardhat test test/ArraySum
npx prettier --write *
```
