//SPDX-License-Identifier: MIT

pragma solidity ^0.8.2; 

import "./ownable.sol";

/**
 * @title BEP20Token - iamhectorsv Token
 * @dev A BEP20 Token for the Binances Smart Chain
 */

contract iamhectorsv is Ownable {
    mapping (address => uint256) internal _balances;    
    address private _owner;
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSuply;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor() {
        _name = "iamhectorsv";
        _symbol = "hsv";
        _decimals = 16;
        _totalSuply = 1000000 ** 10 * uint(_decimals);
        _balances[msg.sender] = _totalSuply;
        _owner =  msg.sender;
    }

    function owner() external view returns (address) {
        return _owner;
    } 

    function name() external view returns (string memory) {
        return _name;
    }

    function symbol() external view returns (string memory) {
        return _symbol;
    }

    function decimals() external view returns (uint8) {
        return _decimals;
    }

    function totalSuply() external view returns (uint256) {
        return _totalSuply;
    }

    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }

    function transferFrom(address from, address to, uint value) external returns (bool) {
        require(_balances[from] >= value, 'balance too low');
        _balances[to] += value;
        _balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }

}