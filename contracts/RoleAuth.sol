pragma solidity ^0.5.0;

contract RoleAuth  {
  uint public roleCount = 0;
  
  struct Role {
    uint id;
    string name;
    Permission per;
  }

  struct Permission{
      string title;
      bool Selected;
  }

  mapping(uint => Role) roles;
  
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
    Permission memory p = Permission('on',true);
    roles[roleCount] = Role(roleCount, name,p);
    
    emit RoleCreated(roleCount, name);
  }

}