pragma solidity ^0.5.0;

contract Authentication{
    address owner;
    uint public deviceCount = 0;
    uint public userCount = 0;

    struct Device {
        uint id;
        string name;
        address account;
    }

    function addDevice(string memory name, address account) public {
        deviceCount ++;
        devices[deviceCount] = Device(deviceCount, name, account);
        emit DeviceAdded(deviceCount, name,account);
    }

    constructor() public {
        owner = msg.sender;
        addUser("Admin User",owner);
    }

    event DeviceAdded(uint id,string name,address account);

    mapping(uint => Device) public devices;

    struct User {
        uint id;
        string name;
        address account;
    }

    function addUser(string memory name, address account) public{
        userCount ++;
        users[userCount] = User(userCount, name, account);
        emit UserAdded(userCount, name, account);
    }

    event UserAdded(uint id,string name,address account);

    mapping(uint => User) public users;

	event DistributeToken(address sender, bytes32 token);
    bytes32 random_number;
    bytes32 token;

    // min and max are not needed now, some future work idea
    function rand() public returns (bytes32) {
        uint256 lastBlockNumber = block.number - 1;
        bytes32 hashVal = bytes32(blockhash(lastBlockNumber));
        return bytes32(hashVal);
    }

    function login_admin() public { 
		random_number = rand();
        token = keccak256(abi.encodePacked(msg.sender, now, random_number));
        emit DistributeToken(msg.sender, token);
    }
}