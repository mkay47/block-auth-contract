pragma solidity ^0.5.0;

contract Login{
  
	uint public deviceCount = 0;
	uint public userCount = 0;

    address owner;
    bytes32 public hash;
    string token_raw;
    bytes32 random_number;

	struct Device {
		uint id;
		string content;
		bool completed;
	}
	
	struct User {
		uint id;
		bool isAdmin;
	}

	event AddDevice(
		uint id,
		string ip,
		bool added
	);

	event LoginAttempt(
		address sender, 
		bytes32 token
	);
    
	event AddUser(
		uint id,
		bool isAdmin
	);
    
    function Login2 () public{
        owner = msg.sender;
    }

	mapping(uint => Device) public devices;

	function addDevice(string memory ip) public {
		deviceCount ++;
		devices[deviceCount] = Device(deviceCount,ip, false);
		emit AddDevice(deviceCount,ip, false);
	}
	
	mapping(uint => User) public users;

	function addUsers() public {
		userCount ++;
		users[userCount] = User(userCount, false);
		emit AddUser(userCount, false);
	}
    
    // min and max are not needed now, some future work idea
    function rand() onlyOwner public returns (bytes32){
        uint256 lastBlockNumber = block.number - 1;
        bytes32 hashVal = bytes32(blockhash(lastBlockNumber));
        return bytes32(hashVal);
    }
    
     function login_admin() onlyOwner public { 
        random_number = rand();
        hash = keccak256(abi.encodePacked(msg.sender,now,random_number));
        emit LoginAttempt(msg.sender, hash);
    }

    modifier onlyOwner {
       require(msg.sender == owner);
        _;
    }
}