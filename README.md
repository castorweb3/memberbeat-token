# MemberBeat Token

## Overview
MemberBeat Token (MBT) is an ERC-20 token on EVM-compatible networks. Users receive MemberBeat Tokens when they subscribe to the MemberBeat Subscription Manager. Each time a user subscribes to a plan, MemberBeat Tokens are minted. These tokens can be utilized on the MemberBeat site for various purposes such as accessing different parts of the app, receiving discounts, participating in events, and more.

### Key Features
- **Subscription Rewards**: Tokens are automatically minted whenever a user subscribes to a plan.
- **Utility**: Tokens can be used on the MemberBeat platform for app access, discounts, event participation, and other features.
- **ERC-20 Standard**: Fully compliant with the ERC-20 token standard, ensuring compatibility with a wide range of wallets and exchanges.
- **Easy Integration**: Seamlessly integrates with the MemberBeat Subscription Manager for smooth token distribution.

## Installation  
    
1. **Install dependencies**:

    ```bash
    make install
    ```
   
2. **Deploy the contract**:
   
    To deploy to a local anvil chain, run:

    ```bash
    make deploy   
    ```

    For Sepolia, run:
    ```bash
    make deploy-sepolia
    ```    

    For Arbitrum Sepolia, run:
    ```bash
    make deploy-arbitrum-sepolia
    ```

## Usage
Once deployed, the MemberBeat Token contract can be interacted with via any ERC-20 compatible wallet or application. Tokens will be minted automatically upon user subscription to a plan through the MemberBeat Subscription Manager.

## License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.

## Testnet Deployments ##
##### arbitrum-sepolia
✅  [Success]Hash: 0x7b076cbd6edcf871200edd0533a3f7b104bdd6c9422b43d3bfa94bac9adcee69
Contract Address: 0xAb18BB847bB262c2a97D80C17397De43933AEc6C
Block: 107534606
Paid: 0.0000824493 ETH (824493 gas * 0.1 gwei)

✅ Sequence #1 on arbitrum-sepolia | Total Paid: 0.0000824493 ETH (824493 gas * avg 0.1 gwei)


ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
##
Start verification for (1) contracts
Start verifying contract `0xAb18BB847bB262c2a97D80C17397De43933AEc6C` deployed on arbitrum-sepolia

Submitting verification for [src/MemberBeatToken.sol:MemberBeatToken] 0xAb18BB847bB262c2a97D80C17397De43933AEc6C.

Submitting verification for [src/MemberBeatToken.sol:MemberBeatToken] 0xAb18BB847bB262c2a97D80C17397De43933AEc6C.
Submitted contract for verification:
        Response: `OK`
        GUID: `idvg5dzy5i33aficdsyvgdwdgcb9yhsawafv17fjndlcfvnaja`
        URL: https://sepolia.arbiscan.io/address/0xab18bb847bb262c2a97d80c17397de43933aec6c
Contract verification status:
Response: `NOTOK`
Details: `Pending in queue`
Contract verification status:
Response: `OK`
Details: `Pass - Verified`
Contract successfully verified
All (1) contracts were verified!


##### optimism-sepolia
✅  [Success]Hash: 0xccffa4da45cd4b6b5200eaad14c4109a145fc1cf21fae9c6358e0329f11e3080
Contract Address: 0x132A580b16483C84C95988423603dD87105E48dD
Block: 21577934
Paid: 0.000000000544866576 ETH (715048 gas * 0.000000762 gwei)

✅ Sequence #1 on optimism-sepolia | Total Paid: 0.000000000544866576 ETH (715048 gas * avg 0.000000762 gwei)
                                                                                                                                                                                                                                                                  

==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
##
Start verification for (1) contracts
Start verifying contract `0x132A580b16483C84C95988423603dD87105E48dD` deployed on optimism-sepolia

Submitting verification for [src/MemberBeatToken.sol:MemberBeatToken] 0x132A580b16483C84C95988423603dD87105E48dD.
Submitted contract for verification:
        Response: `OK`
        GUID: `vzhezflp76nnqd8scbj1llhjgtj2x8dbiembvrbx2r45qw88vu`
        URL: https://sepolia-optimism.etherscan.io/address/0x132a580b16483c84c95988423603dd87105e48dd
Contract verification status:
Response: `NOTOK`
Details: `Pending in queue`
Contract verification status:
Response: `OK`
Details: `Pass - Verified`
Contract successfully verified
All (1) contracts were verified!
