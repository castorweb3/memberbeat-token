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

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {IMemberBeatToken} from "src/IMemberBeatToken.sol";

/**
 * @title MemberBeatToken
 * @dev ERC20 Token that can be minted and burned only by the MemberbeatSubscriptionManager contract.
 */
contract MemberBeatToken is ERC20, Ownable, IMemberBeatToken {
    /**
     * @dev Address of the Memberbeat subscription manager contract (IMemberbeatSubscriptionManager).
     * @notice https://github.com/castorweb3/memberbeat-contracts
     */
    address private s_subscriptionManager;

    /**
     * @dev Error triggered when an invalid address is provided.
     * @param _address The invalid address.
     */
    error MemberBeatToken__InvalidAddress(address _address);

    /**
     * @dev Error triggered when an unauthorized address attempts an action.
     * @param _address The unauthorized address.
     */
    error MemberBeatToken__Unauthorized(address _address);

    /**
     * @dev Modifier to restrict actions to the subscription manager contract.
     */
    modifier onlySubscriptionManager() {
        if (msg.sender != s_subscriptionManager) {
            revert MemberBeatToken__Unauthorized(msg.sender);
        }
        _;
    }

    /**
     * @dev Constructor that initializes the token with a name and a symbol.
     * @param _name The name of the token.
     * @param _symbol The symbol of the token.
     */
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) Ownable(msg.sender) {}

    /**
     * @dev Sets the subscription manager address. Can only be called by the contract owner.
     * @param _subscriptionManager The address of the Memberbeat subscription manager contract.
     */
    function setSubscriptionManager(address _subscriptionManager) external onlyOwner {
        if (_subscriptionManager == address(0)) {
            revert MemberBeatToken__InvalidAddress(_subscriptionManager);
        }
        s_subscriptionManager = _subscriptionManager;
    }

    /**
     * @dev Mints new tokens. Can only be called by the subscription manager contract.
     * @param _account The address to mint tokens to.
     * @param _amount The number of tokens to mint.
     * @notice Emits a {MemberBeatToken__Minted} event.
     */
    function mint(address _account, uint256 _amount) external onlySubscriptionManager {
        _mint(_account, _amount);
        emit MemberBeatToken__Minted(_account, _amount);
    }

    /**
     * @dev Burns tokens. Can only be called by the subscription manager contract.
     * @param _account The address to burn tokens from.
     * @param _amount The number of tokens to burn.
     * @notice Emits a {MemberBeatToken__Burned} event.
     */
    function burn(address _account, uint256 _amount) external onlySubscriptionManager {
        _burn(_account, _amount);
        emit MemberBeatToken__Burned(_account, _amount);
    }
}
