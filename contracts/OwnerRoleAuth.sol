pragma solidity ^0.5.0;

contract OwnerRoleAuth {
  bool public on;
  bool public off;

  constructor() public {
      on = true;
      off = true;
  }

  function updateOwnerRole(bool onCommand,bool offCommand) public {
    on = onCommand;
    off = offCommand;
    emit OwnerRoleUpdated(on, off);
  }

  event OwnerRoleUpdated(
      bool on,
      bool off
  );

}