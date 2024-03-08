// Copyright 2023 The klaytn Authors
// This file is part of the klaytn library.
//
// The klaytn library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The klaytn library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the klaytn library. If not, see <http://www.gnu.org/licenses/>.

// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.19;

import "../SimpleBlsRegistry.sol";

contract SimpleBlsRegistryMock is IKIP113 {
    function getAllBlsInfo() external pure returns (address[] memory, BlsPublicKeyInfo[] memory) {
        address[] memory ret1 = new address[](3);
        ret1[0] = 0x1111111111111111111111111111111111111111;
        ret1[1] = 0x2222222222222222222222222222222222222222;
        ret1[2] = 0x3333333333333333333333333333333333333333;

        BlsPublicKeyInfo[] memory ret2 = new BlsPublicKeyInfo[](3);
        ret2[0] = BlsPublicKeyInfo(
            hex"111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111",
            hex"111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
        );
        ret2[1] = BlsPublicKeyInfo(
            hex"222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222",
            hex"222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222"
        );
        ret2[2] = BlsPublicKeyInfo(
            hex"333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333",
            hex"333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333"
        );

        return (ret1, ret2);
    }
}
