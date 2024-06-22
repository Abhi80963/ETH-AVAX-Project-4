// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    address public owner;

    struct StoreItem {
        string ItemName;
        uint256 Price;
    }

    StoreItem[] public storeItems;
    mapping(address => uint256[]) public redeemedItemIds; 

    constructor() ERC20("Degen", "DGN") {
        _mint(msg.sender, 0);
        owner = msg.sender;

        storeItems.push(StoreItem("Sword", 100));
        storeItems.push(StoreItem("Shield", 150));
        storeItems.push(StoreItem("Health Potion", 50));
        storeItems.push(StoreItem("Degen NFT", 200));
        storeItems.push(StoreItem("Degen Gems", 100));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function redeemTokens(uint256 itemId) external {
        require(itemId < storeItems.length, "Invalid item ID");
        uint256 itemPrice = storeItems[itemId].Price;
        require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance");

        _transfer(msg.sender, owner, itemPrice);
        redeemedItemIds[msg.sender].push(itemId);
    }

    function getPlayerRedeemedItems(address player) external view returns (uint256[] memory) {
        return redeemedItemIds[player];
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
