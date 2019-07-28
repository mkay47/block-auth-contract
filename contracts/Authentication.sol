pragma solidity ^0.5.0;

contract Authentication{
	//global vars
	bytes32 random_number;
	address owner;
	bytes32 public hash;

	// This is the constructor which registers the
    // creator and the assigned name.
    constructor() public {
        owner = msg.sender;
    }
	
	//events
	event LoggedIn(address username,bytes32 password);

	//functions
	function rand() public returns (bytes32){
        uint256 lastBlockNumber = block.number - 1;
        bytes32 hashVal = bytes32(blockhash(lastBlockNumber));
        return bytes32(hashVal);
    }

	function Login() public {
		random_number = rand();
        hash = keccak256(abi.encodePacked(msg.sender,now,random_number));
		emit LoggedIn(msg.sender,hash);
	}
	
}