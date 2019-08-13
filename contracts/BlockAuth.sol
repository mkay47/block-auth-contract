pragma solidity ^0.5.0;

contract BlockAuth{
    uint public deviceCount = 0;
    uint public userCount = 0;

    mapping(uint => Device[]) public devices;
    mapping(uint => User[]) public users;

    struct Device {
        uint id;
        string name;
        address account;
        string ip;
    }

    struct User {
        uint id;
        string name;
        address account;
    }

    function addDevice(string memory name, address account,string memory ip) public {
        deviceCount ++;
        Device memory device = Device(deviceCount, name, account,ip);
        devices[1].push(device);
        emit DeviceAdded(deviceCount, name,account,ip);
    }

    constructor() public {
        addUser("Admin User",msg.sender);
    }

    event DeviceAdded(uint id,string name,address account,string ip);

    function addUser(string memory name, address account) public{
        userCount ++;
        User memory user = User(userCount, name, account);
        users[1].push(user);
        emit UserAdded(userCount, name, account);
    }

    mapping (bytes32=>Document[]) public documents;

    struct Document{
        string name;
        string description;
        address sender;
    }

    function StoreDocument(uint key, string memory name, string memory description) public returns (bool success) {
       Document memory doc = Document(name, description, msg.sender);
       documents[key].push(doc);
       return true;
    }

    event UserAdded(uint id,string name,address account);

	event DistributeToken(address sender, bytes32 token);
    bytes32 random_number;
    bytes32 token;

    // min and max are not needed now, some future work idea
    function rand() public view returns (bytes32) {
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