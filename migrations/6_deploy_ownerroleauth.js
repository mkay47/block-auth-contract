const RoleAuth = artifacts.require("OwnerRoleAuth");
module.exports = function (deployer) {
    deployer.deploy(RoleAuth);
};