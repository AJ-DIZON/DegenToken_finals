// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {
    //contract address 0xd9145CCE52D386f254917e481eB44e9943F39138 

    uint tokenTotal = 0;

    constructor() ERC20("Degen", "DGN") {}

    //Minting new tokens: status: DONE
    //The platform should be able to create new 
    //tokens and distribute them to players as rewards.
    //Only the owner can mint tokens.
    function mint(address account, uint amount) public onlyOwner{
        tokenTotal += amount;
        uint minted = amount * (10 ** uint(decimals()));
        _mint(account, minted);
        console.log("You minted %s tokens", amount);
    }

    //Burning tokens: status: DONE
    //Anyone should be able to burn tokens that they own, that are no longer needed.
    function burnFunc(uint amount) public {
        uint burned = amount * 10 ** uint(decimals());

        require(balanceOf(msg.sender) >= burned, "You dont have enough tokens to burn" );
        
        _burn(msg.sender, burned);
        uint256 currBal  = this.balanceOf(msg.sender);
        currBal = currBal / (10 ** uint(decimals()));
        console.log("You burned %s tokens. Current tokens: %s", amount, currBal);  
    }    

    //Transferring tokens: status: DONE
    //Players should be able to transfer their tokens to others.
    function transferFunc(address account, uint amount) public {
        uint transfered = amount * 10 ** uint(decimals());

        require(balanceOf(msg.sender) >= transfered, "You dont have enough tokens to transfer" );
        
        approve(msg.sender, transfered);
        _transfer(msg.sender, account, transfered);
        console.log("You sent %s tokens to %s", amount, account);
    }

    //Redeeming tokens: status: DONE
    //Players should be able to redeem their tokens for items in the in-game store.
    // 1. tshirt - 5|| 2. hat  - 10|| 3. in-game money - 20
    function redeemFunc(uint choice) public{
        // vault address = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
        address vault = owner();
        uint redeem;
        if (choice == 1){
            redeem = 5 * 10 ** uint(decimals());

            require(balanceOf(msg.sender) >= redeem, "You don't have enough tokens to redeem a shirt");
            //give shirt
            approve(msg.sender, redeem);
            _transfer(msg.sender, vault, redeem);
            console.log("You redeem a t-shirt!!! for 5 tokens");
        }

        if (choice == 2){
            redeem = 10 * 10 ** uint(decimals());

            require(balanceOf(msg.sender) >= redeem, "You don't have enough tokens to redeem a hat");
            //give hat
            approve(msg.sender, redeem);
            _transfer(msg.sender, vault, redeem);
            console.log("You redeem a cool hat!!! for 10 tokens");
        }

        if (choice == 3){
            redeem = 20 * 10 ** uint(decimals());

            require(balanceOf(msg.sender) >= redeem, "You don't have enough tokens to redeem for in-game money");
            //give in-game currency
            approve(msg.sender, redeem);
            _transfer(msg.sender, vault, redeem);
            console.log("You redeem a in-game cash for 20 tokens");
        }else{
            console.log("Invalid choice");
        }
    }

    //Checking token balance: status : DONE
    //Players should be able to check their token balance at any time.
    function checkBalanceFunc(address account) public view returns (uint256){
        require(msg.sender == account, "You're not the owner of this account!!!");
        uint256 balance  = this.balanceOf(account);
        balance = balance / (10 ** uint(decimals()));
        console.log("You have %s tokens", balance);
        return balance;
    }

    //function for the owner
    function ownerCheck(address account) public view onlyOwner returns (uint256){
        uint256 balance  = this.balanceOf(account);
        uint256 trueToken = balance;
        balance = balance / (10 ** uint(decimals()));
        console.log("Player %s has %s tokens", account, balance);
        return trueToken;
    }


}
