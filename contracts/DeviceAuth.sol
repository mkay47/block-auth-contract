pragma solidity ^0.5.0;

contract DeviceAuth{
    uint public deviceCount = 0;
    
    mapping(uint=>Device[]) public devices;
   
    struct Device{
        string name;
        string ip;
    }

    function addDevice(string memory name, string memory ip) public {
        deviceCount ++;
        Device memory device = Device(name, ip);
        devices[1].push(device);
        emit DeviceAdded(deviceCount, name, ip);
    }

    constructor() public {
        addDevice("lights", "192.168.8.186:8081");
    }

    event DeviceAdded(uint id, string name, string ip);
  
	event DistributeToken(address user, bytes32 token);
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