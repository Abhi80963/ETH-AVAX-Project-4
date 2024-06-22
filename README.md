# ETH-AVAX-Project-4
# DegenToken

DegenToken is an ERC20 token deployed on the Avalanche Fuji Test Network. This token includes a simple store where users can redeem their tokens for store items. The token also includes basic functionalities such as minting, burning, and transferring tokens.

## Overview

DegenToken is implemented using the OpenZeppelin ERC20 contract. The contract includes the following features:

- **Minting**: Only the contract owner can mint new tokens.
- **Burning**: Any token holder can burn their tokens.
- **Store**: A list of items that can be redeemed using the tokens. Only the owner can add new items to the store.

## Contract Details

- **Token Name**: Degen
- **Token Symbol**: DGN
- **Initial Supply**: 0 DGN

## Functions

### Owner-Only Functions

1. **mint(address to, uint256 amount)**
   - Mints new tokens and assigns them to the specified address.
   - Only callable by the contract owner.

2. **addStoreItem(string memory itemName, uint256 price)**
   - Adds a new item to the store with a specified name and price.
   - Only callable by the contract owner.

### Public Functions

1. **redeemTokens(uint256 itemId)**
   - Redeems tokens for a store item. The token price of the item is transferred from the caller to the owner.
   - Callable by any user with sufficient token balance.

2. **burn(uint256 amount)**
   - Burns a specified amount of tokens from the caller's balance.
   - Callable by any user.

## Deployment

This contract is deployed on the Avalanche Fuji Test Network. 

To interact with the contract using Remix:

1. **Open Remix**: Go to [Remix IDE](https://remix.ethereum.org/).
2. **Load Contract**: Copy and paste the contract code into a new file in Remix.
3. **Install OpenZeppelin**: Ensure you have imported the OpenZeppelin ERC20 contract.
4. **Compile Contract**: Use the Solidity compiler to compile the contract.
5. **Deploy Contract**: Deploy the contract using the "Injected Web3" environment in Remix and connect your wallet configured for the Avalanche Fuji Test Network.


This README provides a clear and concise overview of your DegenToken project without including the actual contract code, ensuring it is user-friendly and easy to understand.
