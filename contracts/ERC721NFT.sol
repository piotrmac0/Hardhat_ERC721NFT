// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
//counters keep track of total NFTs number and each NFT's Id
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC721NFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("MyERC721NFT", "MYNFT") {}

    //mint function; tokenURI is a string that should resolve to a JSON document that describes the NFT's metadata
    function mintNFT(address recipent, string memory tokenURI) public onlyOwner returns(uint256) {
        //increment number of all NFTs
        _tokenIds.increment();
        //new item creating
        uint256 newItemId = _tokenIds.current();
        _mint(recipent, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}