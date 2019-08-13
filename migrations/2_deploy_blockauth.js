const Authentication = artifacts.require("BlockAuth");
module.exports = function(deployer) {
    deployer.deploy(Authentication);
};