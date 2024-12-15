pragma solidity ^0.5.0;

contract GuestRoleAuth {
  bool public on;
  bool public off;

  constructor() public {
      on = true;
      off = true;
  }

  function updateGuestRole(bool onCommand,bool offCommand) public {
    on = onCommand;
    off = offCommand;
    emit GuestRoleUpdated(on, off);
  }

  event GuestRoleUpdated(
      bool on,
      bool off
  );

}