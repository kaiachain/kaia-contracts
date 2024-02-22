// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.19;

import "../IAddressBook.sol";

contract AddressBookMock is IAddressBook {
    address public constant dummy = 0x0000000000000000000000000000000000000000;
    // addresses derived from the mnemonic test-junk
    // addresses must be aligned with fixtures.ts:getActors()
    address public constant abookAdmin = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    address public constant cn0 = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
    address public constant cn1 = 0x90F79bf6EB2c4f870365E785982E1f101E93b906;
    address public constant cn2 = 0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65;

    function getState() external pure returns (address[] memory, uint256) {
        address[] memory adminList = new address[](1);
        adminList[0] = abookAdmin;
        uint256 requirement = 1;
        return (adminList, requirement);
    }

    function getCnInfo(address _cnNodeId) external pure returns (address, address, address) {
        address[3] memory cnList = [cn0, cn1, cn2];

        for (uint256 i = 0; i < cnList.length; i++) {
            if (_cnNodeId == cnList[i]) {
                return (cnList[i], dummy, dummy);
            }
        }

        revert("Invalid CN node ID.");
    }
}

contract AddressBookMockOneCN is IAddressBook {
    address public constant dummy = 0x0000000000000000000000000000000000000000;
    // addresses derived from the mnemonic test-junk
    // addresses must be aligned with fixtures.ts:getActors()
    address public constant abookAdmin = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    address public constant cn0 = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;

    function getState() external pure returns (address[] memory, uint256) {
        address[] memory adminList = new address[](1);
        adminList[0] = abookAdmin;
        uint256 requirement = 1;
        return (adminList, requirement);
    }

    function getCnInfo(address _cnNodeId) external pure returns (address, address, address) {
        address[1] memory cnList = [cn0];

        for (uint256 i = 0; i < cnList.length; i++) {
            if (_cnNodeId == cnList[i]) {
                return (cnList[i], dummy, dummy);
            }
        }

        revert("Invalid CN node ID.");
    }
}
