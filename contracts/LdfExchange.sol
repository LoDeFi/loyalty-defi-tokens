// contracts/LdfExchange.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./LdfLevelToken.sol";
import "./LdfToken.sol";

contract LdfExchange {
    
    LdfLevelToken public token;

    event Bought(uint256 amount);

    constructor() public {
    }

    function getLoyaltyLevel(uint _amount) payable public {
        LdfToken tokenLol = LdfToken(address(0x9E97c0B080Bd5A28b91362863675c5C6c5262b13));
        uint256 dexBalance = tokenLol.balanceOf(address(msg.sender));
        require(_amount <= dexBalance, "Not enough tokens in the reserve");
        token = new LdfLevelToken(uint16(_amount/500));
        tokenLol.transferFrom(msg.sender, address(0xfE08Fe6155D95D37BAE674993E5C98D5a18C0C2B), _amount);
        LdfLevelToken(address(token)).transferFrom(address(this), msg.sender, 1);
        emit Bought(_amount);
    }
    
    function getSilverLoyaltyLevel() payable public {
        getLoyaltyLevel(500);
    }

    function getGoldLoyaltyLevel() payable public {
        getLoyaltyLevel(1000);
    }

    function getPlatinumLoyaltyLevel() payable public {
        getLoyaltyLevel(3000);
    }
}

