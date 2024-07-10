// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISwap {
    function setRate(uint256 _newRate) external;
    function swap(address tokenIn, address tokenOut, uint256 amount) external;

    event RateSet(address tokenIn, address tokenOut, uint256 oldRate, uint256 newRate);
    event Swap(address indexed swapper, address indexed tokenIn, address indexed tokenOut, uint256 amount, uint256 receivedAmount);
}