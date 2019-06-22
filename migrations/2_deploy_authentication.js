//const Authentication = artifacts.require("Authentication");
const login = artifacts.require("Login");
module.exports = function (deployer) {
    deployer.deploy(login);
};
