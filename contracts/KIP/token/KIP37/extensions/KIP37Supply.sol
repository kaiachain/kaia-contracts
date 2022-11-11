// SPDX-License-Identifier: MIT
// Klaytn Contract Library v1.0.0 (KIP/token/KIP37/extensions/KIP37Supply.sol)
// Based on OpenZeppelin Contracts v4.5.0 (token/ERC1155/extensions/ERC1155Supply.sol)
// as per standard KIP37 totalSupply function already implemented at ../KIP31.sol thus here only implemented exists function
// https://github.com/OpenZeppelin/openzeppelin-contracts/releases/tag/v4.5.0

pragma solidity ^0.8.0;

import "../KIP37.sol";

/**
 * @dev Extension of KIP37 that adds legacy exists function.
 *
 * Useful for scenarios where Fungible and Non-fungible tokens have to be
 * verified that either it already exists/minted or not.
 */
abstract contract KIP37Supply is KIP37 {

    /**
     * @dev Indicates whether any token exist with a given id, or not.
     */
    function exists(uint256 id) public view virtual returns (bool) {
        return KIP37.totalSupply(id) > 0;
    }
}
