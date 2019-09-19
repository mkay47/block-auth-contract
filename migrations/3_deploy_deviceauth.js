const DeviceAuth = artifacts.require("DeviceAuth");
module.exports = function(deployer) {
    deployer.deploy(DeviceAuth);
};