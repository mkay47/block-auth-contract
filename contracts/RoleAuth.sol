pragma solidity ^0.5.0;

contract RoleAuth  {
  uint public roleCount = 0;
  
  struct Role {
    uint id;
    string name;
  }

  mapping(uint => Role) public roles;
  
  event RoleCreated(
    uint id,
    string name
  );

  event RoleUpdate(
    uint id,
    string name
  );

  constructor() public {
    createRole("owner");
  }

  function createRole(string memory name) public {
    roleCount ++;
    roles[roleCount] = Role(roleCount, name);
    emit RoleCreated(roleCount, name);
  }

}