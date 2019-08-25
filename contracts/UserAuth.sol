pragma solidity ^0.5.0;

contract UserAuth{
    uint public userCount = 0;

    mapping(uint=>User[]) public users;

    struct User{
        string username;
        address account;
        string password;
        string role;
        string token;
    }

    function addUser(string memory username, address account,string memory password,string memory role) public {
        userCount ++;
        User memory user = User(username, account, password, role,"OOOOO");
        users[1].push(user);
        emit UserAdded(userCount, username, account);
    }

    constructor() public {
        addUser("admin",msg.sender,"password","admin");
    }

    event UserAdded(uint id,string name,address account);

}