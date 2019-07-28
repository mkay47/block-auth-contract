pragma solidity ^0.5.0;

contract Authentication{
	//global vars
	bytes32 random_number;
	bytes32 public hash;
	
	//events
	event LoggedIn(address username, bytes32 password);

	// private functions
	function rand() public returns (bytes32) {
        uint256 lastBlockNumber = block.number - 1;
        bytes32 hashVal = bytes32(blockhash(lastBlockNumber));
        return bytes32(hashVal);
    }

	//public functions
	function Login() public {
		random_number = rand();
        hash = keccak256(abi.encodePacked(msg.sender, now, random_number));
		emit LoggedIn(msg.sender, hash);
	}
}