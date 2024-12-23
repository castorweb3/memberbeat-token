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

import {Script, console} from "forge-std/Script.sol";

contract HelperConfig is Script {
    uint256 public constant SEPOLIA_CHAIN_ID = 111555111;
    uint256 public constant ARBITRUM_SEPOLIA_CHAIN_ID = 421614;

    struct NetworkConfig {
        address account;
        string tokenName;
        string tokenSymbol;
        address subscriptionManager;
    }

    NetworkConfig activeConfig;

    constructor() {
        if (block.chainid == SEPOLIA_CHAIN_ID) {
            activeConfig = getSepoliaEthConfig();
        } else if (block.chainid == ARBITRUM_SEPOLIA_CHAIN_ID) {
            activeConfig = getArbitrumSepoliaEthConfig();
        } else {
            activeConfig = getOrCreateAnvilEthConfig();
        }
    }

    function getActiveConfig() public view returns (NetworkConfig memory) {
        return activeConfig;
    }

    function getSepoliaEthConfig() public view returns (NetworkConfig memory) {
        return activeConfig;
    }

    function getArbitrumSepoliaEthConfig() public returns (NetworkConfig memory) {
        return createConfig();
    }

    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory) {
        if (activeConfig.account != address(0)) {
            return activeConfig;
        }

        return createConfig();
    }

    function createConfig() private returns (NetworkConfig memory) {
        address account = address(uint160(vm.envUint("OWNER_ACCOUNT")));
        string memory tokenName = vm.envString("TOKEN_NAME");
        string memory tokenSymbol = vm.envString("TOKEN_SYMBOL");        
        string memory subscriptionManagerEnv = vm.envString("SUBSCRIPTION_MANAGER_ADDRESS");
        address subscriptionManager = bytes(subscriptionManagerEnv).length == 0 ? address(0) : vm.envAddress("SUBSCRIPTION_MANAGER_ADDRESS");

        activeConfig = NetworkConfig({
            account: account,
            tokenName: tokenName,
            tokenSymbol: tokenSymbol,
            subscriptionManager: subscriptionManager
        });

        return activeConfig;
    }

}
