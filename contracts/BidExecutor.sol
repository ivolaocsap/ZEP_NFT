// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721/IERC721.sol";

contract BidExecutor {

    address public ZEPPELINFT_Factory;
    bool public factorySet;

    function setNftFactory(address _factory) external {
        require(!factorySet, "Factory has already been set and cannot be changed.");

        ZEPPELINFT_Factory = _factory;
        factorySet = true;
    }

    function executeBid(uint _tokenId, address _bidder) external {
        require(msg.sender == ZEPPELINFT_Factory, "Only the ZEP factory can execute a bid.");

        address owner = IERC721(ZEPPELINFT_Factory).ownerOf(_tokenId);
        IERC721(ZEPPELINFT_Factory).safeTransferFrom(owner, _bidder, _tokenId, "");
    }
}