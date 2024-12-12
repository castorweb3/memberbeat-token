// SPDX-License-Identifier: GPL-3.0

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.

pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";

abstract contract TestingUtils is Test {
    function findEvent(Vm.Log[] memory logs, string memory eventSignature)
        internal
        pure
        returns (Vm.Log memory log, bool found)
    {
        bytes32 eventSigHash = keccak256(bytes(eventSignature));
        console.logBytes32(eventSigHash);
        for (uint256 i = 0; i < logs.length; i++) {
            console.log("Processing log ", i);
            console.logBytes32(logs[i].topics[0]);
            if (logs[i].topics[0] == eventSigHash) {
                log = logs[i];
                found = true;
                return (log, found);
            }
        }
        found = false;
    }
}
