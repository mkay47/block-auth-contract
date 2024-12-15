const Logs = artifacts.require("LogsAuth");
module.exports = function (deployer) {
    deployer.deploy(Logs);
};