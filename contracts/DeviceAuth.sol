pragma solidity ^0.5.0;

contract DeviceAuth{
    uint public deviceCount = 0;
    
    mapping(uint=> Device) public devices;
   
    struct Device{
        uint id;
        string name;
        string ip;
        string status;
        string role;
    }

    function addDevice(string memory name, string memory ip, string memory role) public {
        deviceCount ++;
        devices[deviceCount] = Device(deviceCount, name, ip, "offline", role);
        emit DeviceAdded(deviceCount, name, ip, role);
    }

    function updateDevice(uint _id,string memory name,string memory ip, string memory role) public {
        Device memory _device = devices[_id];
        _device.name = name;
        _device.ip = ip;
        _device.role = role;
        devices[_id] = _device;
        emit DeviceUpdated(_id, _device.name, _device.ip, _device.role);
    }

    constructor() public {
        addDevice("lights", "192.168.8.186:8081","owner");
    }

    event DeviceAdded(uint id, string name, string ip, string role);
    
    event DeviceUpdated(uint id, string name, string ip, string role);

	event DistributeToken(address user,string ip, bytes32 token, string role);
    
    bytes32 random_number;
    bytes32 token;

    // min and max are not needed now, some future work idea
    function rand() public view returns (bytes32) {
        uint256 lastBlockNumber = block.number - 1;
        bytes32 hashVal = bytes32(blockhash(lastBlockNumber));
        return bytes32(hashVal);
    }

    function login_admin(string memory ip, string memory role) public {
		random_number = rand();
        token = keccak256(abi.encodePacked(msg.sender, now, random_number));
        emit DistributeToken(msg.sender, ip, token, role);
    }
}