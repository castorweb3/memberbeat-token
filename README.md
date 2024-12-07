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
