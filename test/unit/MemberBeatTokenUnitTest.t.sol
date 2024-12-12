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
import {MemberBeatToken} from "src/MemberBeatToken.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";
import {DeployToken} from "script/DeployToken.s.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {TestingUtils} from "test/TestingUtils.t.sol";
import {Vm} from "forge-std/Vm.sol";

contract MemberBeatTokenUnitTest is Test, TestingUtils {
    DeployToken deployer;
    HelperConfig helperConfig;
    HelperConfig.NetworkConfig config;

    address RANDOM_USER = makeAddr("randomUser");
    uint256 constant MINT_AMOUNT = 1 ether;
    uint256 constant BURN_AMOUNT = 1 ether;

    MemberBeatToken token;

    modifier mintsAmount(address account, uint256 amount) {
        vm.prank(config.subscriptionManager);
        token.mint(account, amount);
        _;
    }

    function setUp() public {
        deployer = new DeployToken();
        (token, helperConfig) = deployer.deployToken();
        config = helperConfig.getActiveConfig();
    }

    function testSetSubscriptionManagerRevertsIfNotOwner() public {
        vm.prank(RANDOM_USER);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, RANDOM_USER));
        token.setSubscriptionManager(address(1));
    }

    function testSetSubscriptionManagerRevertsIfInvalidAddress() public {
        vm.prank(config.account);
        vm.expectRevert(abi.encodeWithSelector(MemberBeatToken.MemberBeatToken__InvalidAddress.selector, address(0)));
        token.setSubscriptionManager(address(0));
    }

    function testMintRevertsIfNotSubscriptionManager() public {
        vm.prank(RANDOM_USER);
        vm.expectRevert(abi.encodeWithSelector(MemberBeatToken.MemberBeatToken__Unauthorized.selector, RANDOM_USER));
        token.mint(RANDOM_USER, MINT_AMOUNT);
    }

    function testMintMintsCorrectAmount() public {
        vm.prank(config.subscriptionManager);
        token.mint(RANDOM_USER, MINT_AMOUNT);
        uint256 balance = IERC20(token).balanceOf(RANDOM_USER);
        assertEq(balance, MINT_AMOUNT);
    }

    function testMintEmitsMintedEvent() public {
        vm.recordLogs();
        vm.prank(config.subscriptionManager);
        token.mint(RANDOM_USER, MINT_AMOUNT);

        Vm.Log[] memory entries = vm.getRecordedLogs();
        (Vm.Log memory mintedEvent, bool found) = findEvent(entries, "MemberBeatToken__Minted(address,uint256)");
        assert(found);

        address account = address(uint160(uint256(mintedEvent.topics[1])));
        uint256 amount = uint256(mintedEvent.topics[2]);

        assertEq(account, RANDOM_USER);
        assertEq(amount, MINT_AMOUNT);
    }

    function testBurnRevertsIfNotSubscriptionManager() public {
        vm.prank(RANDOM_USER);
        vm.expectRevert(abi.encodeWithSelector(MemberBeatToken.MemberBeatToken__Unauthorized.selector, RANDOM_USER));
        token.burn(RANDOM_USER, BURN_AMOUNT);
    }

    function testBurnBurnsCorrectAmount() public mintsAmount(RANDOM_USER, MINT_AMOUNT) {
        vm.prank(config.subscriptionManager);
        token.burn(RANDOM_USER, BURN_AMOUNT);
        uint256 balance = IERC20(token).balanceOf(RANDOM_USER);
        assertEq(balance, MINT_AMOUNT - BURN_AMOUNT);
    }
}
