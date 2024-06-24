// Copyright 2024 Kaia DLT Foundation
// Copyright 2023-2024 The klaytn Authors
// This file is part of the kaia library.
//
// The kaia library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The kaia library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the kaia library. If not, see <http://www.gnu.org/licenses/>.

// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.19;

/// @title KIP-113 BLS public key registry
/// @dev See https://github.com/kaiachain/kips/issues/113
interface IKIP113 {
    struct BlsPublicKeyInfo {
        /// @dev compressed BLS12-381 public key (48 bytes)
        bytes publicKey;
        /// @dev proof-of-possession (96 bytes)
        ///  must be a result of PopProve algorithm as per
        ///  draft-irtf-cfrg-bls-signature-05 section 3.3.3.
        ///  with ciphersuite "BLS_SIG_BLS12381G2_XMD:SHA-256_SSWU_RO_POP_"
        bytes pop;
    }

    /// @dev Returns all the stored addresses, public keys, and proof-of-possessions at once.
    ///  _Note_ The function is not able to verify the validity of the public key and the proof-of-possession due to the lack of [EIP-2537](https://eips.ethereum.org/EIPS/eip-2537). See [validation](https://kips.kaia.io/KIPs/kip-113#validation) for off-chain validation.
    function getAllBlsInfo() external view returns (address[] memory nodeIdList, BlsPublicKeyInfo[] memory pubkeyList);
}
