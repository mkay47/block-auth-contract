pragma solidity ^0.5.0;

contract DeviceAuth{
    uint public deviceCount = 0;
    
    mapping(uint=> Device) public devices;
   
    struct Device{
        uint id;
        string name;
        string ip;
    }

    function addDevice(string memory name, string memory ip) public {
        deviceCount ++;
        devices[deviceCount] = Device(deviceCount, name, ip);
        emit DeviceAdded(deviceCount, name, ip);
    }

    function updateDevice(uint _id,string memory name,string memory ip) public {
        Device memory _device = devices[_id];
        _device.name = name;
        _device.ip = ip;
        devices[_id] = _device;
        emit DeviceUpdated(_id, _device.name, _device.ip);
    }

    constructor() public {
        addDevice("lights", "192.168.8.186:8081");
    }

    event DeviceAdded(uint id, string name, string ip);
    
    event DeviceUpdated(uint id, string name, string ip);

	event DistributeToken(address user,string ip, bytes32 token, string role);
    
    bytes32 random_number;
    bytes32 token;

    // min and max are not needed now, some future work idea
    function rand() public view returns (bytes32) {
        uint256 lastBlockNumber = block.number - 1;
        bytes32 hashVal = bytes32(blockhash(lastBlockNumber));
        return bytes32(hashVal);
    }

    function login_admin(string memory ip,string memory role) public {
		random_number = rand();
        token = keccak256(abi.encodePacked(msg.sender, now, random_number));
        emit DistributeToken(msg.sender, ip, token, role);
    }
}