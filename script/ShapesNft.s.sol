// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ShapesNft} from "../src/ShapesNft.sol";
import {Script, console} from "forge-std/Script.sol";

contract ShapesNftScript is Script {
    function run() external returns (ShapesNft) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        ShapesNft shapesNft = new ShapesNft(
            "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI4MCIgd2lkdGg9IjM2MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8cG9seWdvbiBwb2ludHM9IjE1MCwxNSAyNTgsNzcgMjU4LDIwMiAxNTAsMjY1IDQyLDIwMiA0Miw3NyIgc3R5bGU9ImZpbGw6bGltZTtzdHJva2U6cHVycGxlO3N0cm9rZS13aWR0aDozIiAvPgogIFNvcnJ5LCB5b3VyIGJyb3dzZXIgZG9lcyBub3Qgc3VwcG9ydCBpbmxpbmUgU1ZHLgo8L3N2Zz4=",
            "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjE3MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KwqAgPHJlY3Qgd2lkdGg9IjE1MCIgaGVpZ2h0PSIxNTAiIHg9IjEwIiB5PSIxMCIcng9IjIwIiByeT0iMjAiIHN0eWxlPSJmaWxsOnJlZDtzdHJva2U6YmxhY2s7c3Ryb2tlLXdpZHRoOjU7b3BhY2l0eTowLjUiIC8CiAgU29ycnksIHlvdXIgYnJvd3NlciBkb2VzIG5vdCBzdXBwb3J0IGlubGluZSBTVkcuCjwvc3ZnPg==",
            "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjIyMCIgd2lkdGg9IjUwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8cG9seWdvbiBwb2ludHM9IjEwMCwxMCAxNTAsMTkwIDUwLDE5MCIgc3R5bGUImZpbGw6bGltZTtzdHJva2U6cHVycGxlO3N0cm9rZS13aWR0aDozIiAvPgogIFNvcnJ5LCB5b3VyIGJyb3dzZXIgZG9lcyBub3Qgc3VwcG9ydCBpbmxpbmUgU1ZHLgo8L3N2Zz4=",
            0xDaB8892C07FB4C362Dd99D9a2fBFf8B555D39Cb5
        );

        vm.stopBroadcast();

        return shapesNft;
    }
}
