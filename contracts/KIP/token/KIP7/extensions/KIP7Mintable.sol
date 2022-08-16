// SPDX-License-Identifier: MIT
// Klaytn Contract Library v1.0.0 (KIP/token/KIP7/extensions/KIP7Mintable.sol)

pragma solidity ^0.8.0;

import "../KIP7.sol";
import "../../../../access/AccessControlEnumerable.sol";
import "../../../interfaces/IKIP7Mintable.sol";

/**
 * @dev Extension of KIP7 that supports permissioned token minting
 * See https://kips.klaytn.com/KIPs/kip-7#minting-extension
 */
abstract contract KIP7Mintable is KIP7, AccessControlEnumerable, IKIP7Mintable {
    bytes32 public constant MINTER_ROLE = keccak256("KIP7_MINTER_ROLE");

    /**
     * @dev See {IKIP7Mintable-mint}
     *
     * IMPORTANT: this uses _safeMint internally, please be aware that if you do not want this safety functionality, replace with _mint
     *
     * Emits a {Transfer} event with 0X0 as the `from` account
     */
    function mint(address account, uint256 amount)
        public
        virtual
        override
        returns (
            // onlyRole(MINTER_ROLE)
            bool
        )
    {
        require(hasRole(MINTER_ROLE, _msgSender()), "KIP7Mintable: must have minter role to mint");
        _safeMint(account, amount);
        return true;
    }

    /**
     * @dev Returns true if `interfaceId` is implemented and false otherwise
     *
     * See {IKIP13} and {IERC165}.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(KIP7, AccessControlEnumerable)
        returns (bool)
    {
        return
            interfaceId == type(IKIP7Mintable).interfaceId ||
            KIP7.supportsInterface(interfaceId) ||
            AccessControlEnumerable.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IKIP7Mintable-isMinter}
     */
    function isMinter(address account) public view override returns (bool) {
        return hasRole(MINTER_ROLE, account);
    }

    /**
     * @dev See {IKIP7Mintable-addMinter}
     *
     * Emits a {RoleGranted} event
     */
    function addMinter(address account) public override onlyRole(DEFAULT_ADMIN_ROLE) {
        grantRole(MINTER_ROLE, account);
    }

    /**
     * @dev See {IKIP7Mintable-renounceMinter}
     *
     * Emits a {RoleRevoked} event
     */
    function renounceMinter() public override {
        renounceRole(MINTER_ROLE, msg.sender);
    }
}
