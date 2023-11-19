# Degen Token (ERC-20): Unlocking the Future of Gaming

## Description

I have created a ERC20 token for Degen Gaming called Degen. This contract can mint, burn, transfer, redeem, and check tokens. The host address
has access to both minting the tokens, and checking the balance of other players. Players have a more limited use, they can burn, redeem and
check their own and only their own tokens.

Functions:

mint(address account, uint amount) - mints new tokens. Only the owner can create them.
burnFunc(uint amount) - burns owned tokens. Must have more tokens than to burn.
transferFunc(address account, uint amount) - Transfers tokens to another player. They must have more tokens than they can transfer.
redeemFunc(uint choice) - redeems tokens for prizes. Redeemed tokens will be moved to the owner.
checkBalanceFunc(address account) - Checks the player's balance. Only the players themselves can check.
ownerCheck(address account) - Only the owner can check other people's balance.

### How to get it started

1. Clone the github repository to Remix IDE: https://remix.ethereum.org/
2. Compile the smart contract
3. Make sure MetaMask is open and change the enviroment to it.
4. Deploy the contract and now you can use it.

## Authors

Albert Josh Dizon

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details
