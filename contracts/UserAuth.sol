pragma solidity ^0.5.0;

contract UserAuth{
    uint public userCount = 0;

    mapping(uint => User) public users;

    struct User{
        uint id;
        string username;
        address account;
        string password;
        string role;
        string token;
    }

    function addUser(string memory username, address account,string memory password,string memory role) public {
        userCount ++;
        users[userCount] = User(userCount,username, account, password, role,"OOOOO");
        emit UserAdded(userCount, username, account);
    }

    function updateUser(uint _id,string memory name,string memory password, string memory role) public {
        User memory _user = users[_id];
        _user.username = name;
        _user.role = role;
        users[_id] = _user;
        emit UserUpdated(_id, _user.username, _user.role);
    }

    constructor() public {
        addUser("owner",msg.sender,"password","owner");
    }

    event UserAdded(uint id,string name,address account);
    event UserUpdated(uint id, string name, string password);

}