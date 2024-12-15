const Auth = artifacts.require('./GuestRoleAuth.sol');

contract('GuestRoleAuth', (accounts) => {
    before(async () => {
        this.Auth = await Auth.deployed();
    });

    it('deploys successfully', async () => {
        const address = await this.Auth.address;
        assert.notEqual(address, 0x0);
        assert.notEqual(address, '');
        assert.notEqual(address, null);
        assert.notEqual(address, undefined);
    });

    /*it('add device', async() => {
        const result = await this.Auth.adddevice("mkay", "0xddc3d617df684d960330eaea6b45704ff5ecf60b");
        const deviceCount = await this.Auth.deviceCount();
        assert.equal(deviceCount, 2);
        const event = result.logs[0].args;
        assert.equal(event.id.toNumber(), deviceCount.toNumber());
        assert.equal(event.name, 'mkay');
        assert.equal(event.account.toLowerCase(), '0xddc3d617df684d960330eaea6b45704ff5ecf60b');
    });*/

    /*

    it('trigger event', async() => {
        const result = await this.Auth.login_admin('192.168.8.186');
        const event = result.logs[0].args;
        assert.equal(event.device.toLowerCase(), '0xE1294B1Ec5A7587222bDd10d8647bdE559bC1CE0');
    });
    
        it('add device', async() => {
            const result = await this.Auth.addDevice("lights", "0xddc3d617df684d960330eaea6b45704ff5ecf60b", "10.100.120.1");
            const deviceCount = await this.Auth.deviceCount();
            assert.equal(deviceCount, 1);
            const event = result.logs[0].args;
            assert.equal(event.id.toNumber(), deviceCount.toNumber());
            assert.equal(event.name, 'lights');
            assert.equal(event.account.toLowerCase(), '0xddc3d617df684d960330eaea6b45704ff5ecf60b');
            assert.equal(event.ip, '10.100.120.1');
        });*/

});