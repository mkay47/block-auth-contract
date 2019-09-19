const Auth = artifacts.require("Authentication");
module.exports = function (deployer) {
    deployer.deploy(Auth);
};
