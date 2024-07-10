
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISwap {
    function approveMaxValue(address token) external; //approve value 2^256 - 1
    function setTokenA(address _tokenA) external; // only callable by admin role
    function setTokenB(address _tokenB) external; // only callable by admin role
    function setRateA(uint256 _newRate) external; // only callable by  admin role
    function setRateB(uint256 _newRate) external; // only callable by admin role
    function swap(address tokenA, address tokenB, uint256 amount) external;

    function grantRole(bytes32 role, address account) external; // only callable by admin role
    function revokeRole(bytes32 role, address account) external; // only callable by admin role
    function hasRole(bytes32 role, address account) external view returns (bool);
    function getRoleMembers(bytes32 role) external view returns (address[] memory);

    event TokenASet(address indexed oldTokenA, address indexed newTokenA);
    event TokenBSet(address indexed oldTokenB, address indexed newTokenB);
    event RateASet(uint256 oldRateA, uint256 newRateA);
    event RateBSet(uint256 oldRateB, uint256 newRateB);
    event Swap(address indexed swapper, address indexed tokenA, address indexed tokenB, uint256 amount, uint256 receivedAmount);
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);
}