// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Swap {

    struct SwapType {
        address tokenA;
        address tokenB;
    }

    mapping(bytes32 => uint256) public rate;

    function _getSwapTypeHash(SwapType memory swapType) private pure returns (bytes32) {
        return keccak256(abi.encode(swapType.tokenA, swapType.tokenB));
    }

    function setRate(address tokenA, address tokenB, uint256 _rate) public {
        SwapType memory swapType = SwapType(tokenA, tokenB);
        bytes32 hash = _getSwapTypeHash(swapType);
        rate[hash] = _rate;
    }

    function getRate(address tokenA, address tokenB) public view returns (uint256) {
        SwapType memory swapType = SwapType(tokenA, tokenB);
        bytes32 hash = _getSwapTypeHash(swapType);
        return rate[hash];
    }

}