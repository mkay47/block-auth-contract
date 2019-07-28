module.exports = {
    networks: {
        local: {
            host: "localhost",
            port: 7545,
            network_id: "*" // Match any network id
        },
        development: {
            host: "192.168.8.106",
            port: 7545,
            network_id: "*" // Match any network id
        }
    },
    solc: {
        optimizer: {
            enabled: true,
            runs: 200
        }
    }
};