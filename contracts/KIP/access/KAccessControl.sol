// SPDX-License-Identifier: MIT
// Klaytn Contract Library v1.0.1 (KIP/access/KAccessControl.sol)
// Inherited from Openzepplin Accesscontrol
// https://github.com/OpenZeppelin/openzeppelin-contracts/releases/tag/v4.5.0
// Note - adding KIP13 interface for a backward compatible implementation

pragma solidity ^0.8.0;

import "../../access/AccessControl.sol";
import "../utils/introspection/KIP13.sol";

abstract contract KAccessControl is KIP13, AccessControl {
    function supportsInterface(bytes4 interfaceId) public view virtual override(KIP13, AccessControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
