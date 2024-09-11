// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract ShapesNft is ERC721, ERC721URIStorage, Ownable {
    using Strings for uint256;

    uint8 public constant MAX_SUPPLY = 100;
    uint256 private _nextTokenId;
    string[] private _shapesImageUri;

    error AddressZeroNotAllowed();
    error MaxSupplyReached();

    constructor(
        string memory triangleImageUri,
        string memory squareImageUri,
        string memory hexagonImageUri,
        address initialOwner
    ) ERC721("Shapes NFT", "SN") Ownable(initialOwner) {
        _nextTokenId = 1;
        _shapesImageUri.push(triangleImageUri);
        _shapesImageUri.push(squareImageUri);
        _shapesImageUri.push(hexagonImageUri);
    }

    function mintNft() external {
        if (msg.sender == address(0)) {
            revert AddressZeroNotAllowed();
        }
        if (_nextTokenId >= MAX_SUPPLY) {
            revert MaxSupplyReached();
        }
        _safeMint(msg.sender, _nextTokenId);
        _nextTokenId++;
    }

    function safeMint() public onlyOwner {
        if (msg.sender == address(0)) {
            revert AddressZeroNotAllowed();
        }
        if (_nextTokenId >= MAX_SUPPLY) {
            revert MaxSupplyReached();
        }

        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI(tokenId));
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name": "',
                                name(),
                                '", "id": "',
                                tokenId.toString(),
                                '", "description": "A shape NFT", "image": "',
                                _shapesImageUri[getShape()],
                                '"}'
                            )
                        )
                    )
                )
            );
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function getShape() internal view returns (uint256 index) {
        if (block.timestamp % 2 == 0) {
            return 0;
        } else if (block.timestamp % 3 == 0) {
            return 1;
        } else {
            return 2;
        }
    }
}
