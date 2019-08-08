const Auth = artifacts.require('./Authentication.sol');

contract('Authentication', (accounts) => {
    before(async() => {
        this.Auth = await Auth.deployed();
    });

    it('deploys successfully', async() => {
        const address = await this.Auth.address;
        assert.notEqual(address, 0x0);
        assert.notEqual(address, '');
        assert.notEqual(address, null);
        assert.notEqual(address, undefined);
    });

    it('trigger event', async() => {
        const result = await this.Auth.login_admin();
        const event = result.logs[0].args;
        assert.equal(event.sender.toLowerCase(), '0x9ada8c4979caad44fe7a2b6fb6a45bcd67b8657e');
    });

});