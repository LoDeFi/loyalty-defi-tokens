// contracts/LdfExchange.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./LdfLevelToken.sol";
import "./LdfToken.sol";
import "./LdfExchange.sol";

contract LdfExchangeSilver is LdfExchange {
    
    function getSilverLoyaltyLevel() payable public {
        getLoyaltyLevel(500);
    }
}

