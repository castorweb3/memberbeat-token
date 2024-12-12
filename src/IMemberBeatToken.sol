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

/**
 * @title MemberBeatToken
 * @dev ERC20 Token that can be minted and burned only by the MemberbeatSubscriptionManager contract.
 */
interface IMemberBeatToken {
    event MemberBeatToken__Minted(address _account, uint256 _amount);
    event MemberBeatToken__Burned(address _account, uint256 _amount);

    /**
     * @dev Mints new tokens. Can only be called by the subscription manager contract.
     * @param _account The address to mint tokens to.
     * @param _amount The number of tokens to mint.
     */
    function mint(address _account, uint256 _amount) external;

    /**
     * @dev Burns tokens. Can only be called by the subscription manager contract.
     * @param _account The address to burn tokens from.
     * @param _amount The number of tokens to burn.
     */
    function burn(address _account, uint256 _amount) external;
}
