const RoleAuth = artifacts.require("GuestRoleAuth");
module.exports = function (deployer) {
    deployer.deploy(RoleAuth);
};