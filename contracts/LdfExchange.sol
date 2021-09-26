// contracts/LdfExchange.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./LdfLevelToken.sol";
import "./LdfToken.sol";
// /home/nikita/Documents/



// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LdfExchange {
    
    LdfLevelToken public token;

    event Bought(uint256 amount);
    event Sold(uint256 amount);

    constructor() public {
        token = new LdfLevelToken(1);
    }

    function buyLoyaltyLevel(uint _amount) payable public {
        LdfToken tokenLol = LdfToken(address(0x9E97c0B080Bd5A28b91362863675c5C6c5262b13));
        uint256 dexBalance = tokenLol.balanceOf(address(msg.sender));
        require(_amount <= dexBalance, "Not enough tokens in the reserve");
        tokenLol.transferFrom(msg.sender, address(0xfE08Fe6155D95D37BAE674993E5C98D5a18C0C2B), _amount);
        LdfLevelToken(address(token)).transferFrom(address(this), msg.sender, 1);
        emit Bought(1);
}

}

