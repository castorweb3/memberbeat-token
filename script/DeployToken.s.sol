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

import {Script} from "forge-std/Script.sol";
import {MemberBeatToken} from "src/MemberBeatToken.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";

contract DeployToken is Script {
    function run() public {
        deployToken();
    }

    function deployToken() public returns (MemberBeatToken, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory config = helperConfig.getActiveConfig();

        vm.startBroadcast(config.account);
        MemberBeatToken memberBeatToken = new MemberBeatToken(config.tokenName, config.tokenSymbol);

        memberBeatToken.setSubscriptionManager(config.subscriptionManager);

        vm.stopBroadcast();
        return (memberBeatToken, helperConfig);
    }
}
