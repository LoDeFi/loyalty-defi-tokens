// contracts/LdfLevelToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LdfLevelToken is ERC721 {
    uint256 public tokenCounter;
    uint16 public loyaltyLvl;

    constructor(uint16 _loyaltyLvl) public ERC721("LoyaltyDefiLevelToken", "LDFL") {
        loyaltyLvl = _loyaltyLvl;
        tokenCounter = 0;
    }

    function createCollectable(string memory tokenURI) public returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newTokenId;
    }

}