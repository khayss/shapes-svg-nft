include .env

rpc_url:= ${SEPOLIA_RPC_URL}
etherscan_api_key:= ${ETHERSCAN_API_KEY}
script:= ShapesNftScript
script_name:= ShapesNft
chain:= sepolia
chain_id:= 11155111
contract_address:= 0x11C4f03ba6E4A87ea9E4608373cAb3A063FffE7d
contract_file:= ShapesNft
contract_name:= ShapesNft
constructor_args:= $(shell cast abi-encode \
		"constructor(string,string,string,address)" \
        "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI4MCIgd2lkdGg9IjM2MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8cG9seWdvbiBwb2ludHM9IjE1MCwxNSAyNTgsNzcgMjU4LDIwMiAxNTAsMjY1IDQyLDIwMiA0Miw3NyIgc3R5bGU9ImZpbGw6bGltZTtzdHJva2U6cHVycGxlO3N0cm9rZS13aWR0aDozIiAvPgogIFNvcnJ5LCB5b3VyIGJyb3dzZXIgZG9lcyBub3Qgc3VwcG9ydCBpbmxpbmUgU1ZHLgo8L3N2Zz4=" \
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjE3MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KwqAgPHJlY3Qgd2lkdGg9IjE1MCIgaGVpZ2h0PSIxNTAiIHg9IjEwIiB5PSIxMCIcng9IjIwIiByeT0iMjAiIHN0eWxlPSJmaWxsOnJlZDtzdHJva2U6YmxhY2s7c3Ryb2tlLXdpZHRoOjU7b3BhY2l0eTowLjUiIC8CiAgU29ycnksIHlvdXIgYnJvd3NlciBkb2VzIG5vdCBzdXBwb3J0IGlubGluZSBTVkcuCjwvc3ZnPg==" \
        "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjIyMCIgd2lkdGg9IjUwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8cG9seWdvbiBwb2ludHM9IjEwMCwxMCAxNTAsMTkwIDUwLDE5MCIgc3R5bGUImZpbGw6bGltZTtzdHJva2U6cHVycGxlO3N0cm9rZS13aWR0aDozIiAvPgogIFNvcnJ5LCB5b3VyIGJyb3dzZXIgZG9lcyBub3Qgc3VwcG9ydCBpbmxpbmUgU1ZHLgo8L3N2Zz4=" \
        0xDaB8892C07FB4C362Dd99D9a2fBFf8B555D39Cb5)


deploy:
	@forge script \
	--chain $(chain) \
	script/$(script_name).s.sol:$(script) \
	--rpc-url $(rpc_url) \
	--broadcast --verify -vvvv

verify:
	@forge verify-contract \
    --chain-id $(chain_id) \
    --num-of-optimizations 200 \
    --watch \
    --constructor-args $(constructor_args) \
    --etherscan-api-key $(etherscan_api_key) \
    ${contract_address} \
    src/${contract_file}.sol:${contract_name} 