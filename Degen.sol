// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    address public owner;

    constructor() ERC20("Degen", "DGN") {
    _mint(msg.sender,1000);
    owner=msg.sender;
    }

    modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function");
    _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
    }

    struct StoreItem {
        string itemName;
        uint256 price;
    }
    StoreItem[] public storeItems;

    function addStoreItem(string memory itemName, uint256 price) external onlyOwner {
        storeItems.push(StoreItem(itemName, price));
    }

    function redeemTokens(uint256 itemId) external {
        require(itemId < storeItems.length, "Invalid item ID");
        uint256 itemPrice = storeItems[itemId].price;
        require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance");

        _transfer(msg.sender, owner, itemPrice);
    }
    function burn(uint256 amount) public {
    _burn(msg.sender, amount);
    }
}
