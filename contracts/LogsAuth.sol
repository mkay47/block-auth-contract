pragma solidity ^0.5.0;

contract LogsAuth{
    uint public logsCount = 0;

    mapping(uint => Log) public logs;

    struct Log{
        uint id;
        string action;
        address account;
        string role;
    }

    function addLog(string memory action, address account, string memory role) public {
        logsCount ++;
        logs[logsCount] = Log(logsCount,action, account, role);
        emit LogAdded(logsCount, action, account, role);
    }

    event LogAdded(uint id,string action,address account, string role);
}