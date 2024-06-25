// Copyright 2024 Kaia DLT Foundation
// Copyright 2022-2024 The klaytn Authors
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
pragma solidity ^0.8.0;
import "../IVoting.sol";
import "../Voting.sol";

contract VotingMock is Voting {
    constructor(address _tracker, address _secretary)
    Voting(_tracker, _secretary) {
        queueTimeout = 60;
        execDelay = 15;
        execTimeout = 60;
    }
}
