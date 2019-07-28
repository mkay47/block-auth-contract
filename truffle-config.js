module.exports = {
    networks: {
        local: {
            host: "localhost",
            port: 7545,
            network_id: "*" // Match any network id
        },
        development: {
            host: "10.100.11.99",
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