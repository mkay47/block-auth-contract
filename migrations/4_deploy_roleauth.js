const RoleAuth = artifacts.require("RoleAuth");
module.exports = function(deployer) {
    deployer.deploy(RoleAuth);
};