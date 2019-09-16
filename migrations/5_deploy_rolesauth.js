const Roles = artifacts.require("RoleAuth");
module.exports = function(deployer) {
    deployer.deploy(Roles);
};