pragma solidity ^0.5.0;

contract RoleAuth {
  OwnerRole public or;
  GuestRole public gr;

  struct OwnerRole {
    bool on;
    bool off;
  }

  struct GuestRole {
    bool on;
    bool off;
  }

  event OwnerRoleUpdated(
    bool on,
    bool off
  );

  event GuestRoleUpdated(
    bool on,
    bool off
  );
  
  constructor() public {
    updateOwnerRole(true,true);
    UpdateGuestRole(true,true);
  }


  function updateOwnerRole(bool on,bool off) public {
    OwnerRole memory _or = or;
    _or.on = on;
    _or.off = off;
    emit OwnerRoleUpdated(_or.on, _or.off);
  }

  function UpdateGuestRole(bool on,bool off) public {
    GuestRole memory _gr = gr;
    _gr.on = on;
    _gr.off = off;
    emit GuestRoleUpdated(_gr.on, _gr.off);
  }

}