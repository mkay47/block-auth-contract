pragma solidity ^0.5.0;

contract RoleAuth {
  uint public roleCount = 0;
  
  struct Role {
    uint id;
    string name;
    mapping(uint => Permission) permissions;
  }

  struct Permission{
      string title;
      bool Selected;
  }

  mapping(uint => Role) public roles;
  mapping(uint => Permission) public permissions;

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
    
    roles[roleCount].permissions[0].title = 'turn on';
    roles[roleCount].permissions[0].Selected = true;
    
    roles[roleCount].permissions[1].title = 'turn off';
    roles[roleCount].permissions[1].Selected = true;
    
    emit RoleCreated(roleCount, name);
  }

}