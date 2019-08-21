const BlockAuth = artifacts.require("BlockAuth");
module.exports = function(deployer) {
    deployer.deploy(BlockAuth);
};