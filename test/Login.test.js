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

    it('add user', async() => {
        const result = await this.Auth.addUser("mkay", "0xddc3d617df684d960330eaea6b45704ff5ecf60b");
        const userCount = await this.Auth.userCount();
        assert.equal(userCount, 2);
        const event = result.logs[0].args;
        assert.equal(event.id.toNumber(), userCount.toNumber());
        assert.equal(event.name, 'mkay');
        assert.equal(event.account.toLowerCase(), '0xddc3d617df684d960330eaea6b45704ff5ecf60b');
    });

    it('list users', async() => {
        const userCount = await this.Auth.userCount();
        //const user = await this.Auth.users(userCount);

        /*assert.equal(user.id.toNumber(), userCount.toNumber());
        assert.equal(user.name, 'Admin User');
        assert.equal(user.account.toLowerCase(), '0x9ada8c4979caad44fe7a2b6fb6a45bcd67b8657e');
        assert.equal(userCount.toNumber(), 1);*/
        //console.log("userCount", userCount.toNumber());
        for (var i = 0; i <= userCount; i++) {
            const user = await this.Auth.users(i);
            console.log(i, user.id.toNumber() + ' ' + user.name + ' ' + user.account.toLowerCase());
        }

    });

    /*it('trigger event', async() => {
        const result = await this.Auth.login_admin();
        const event = result.logs[0].args;
        assert.equal(event.sender.toLowerCase(), '0x9ada8c4979caad44fe7a2b6fb6a45bcd67b8657e');
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