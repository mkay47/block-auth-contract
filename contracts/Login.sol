pragma solidity ^0.5.0;

contract Login{

    address owner;
    bytes32 public hash;
    bytes32 random_number;

	event LoginAttempt(address sender, bytes32 token);
    
    function Login2 () public{
        owner = msg.sender;
    }
    
    // min and max are not needed now, some future work idea
    function rand() onlyOwner public returns (bytes32){
        uint256 lastBlockNumber = block.number - 1;
        bytes32 hashVal = bytes32(blockhash(lastBlockNumber));
        return bytes32(hashVal);
    }
    
     function login_admin() public { 
		random_number = rand();
        hash = keccak256(abi.encodePacked(msg.sender,now,random_number));
        emit LoginAttempt(msg.sender, hash);
    }

    modifier onlyOwner {
       require(msg.sender == owner);
        _;
    }
}