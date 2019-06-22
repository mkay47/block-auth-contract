//var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "orange apple banana ... ";
module.exports = {
    networks: {
        development: {
            host: "localhost",
            port: 7545,
            network_id: "*" // Match any network id
        }/*,
		ropsten: {
			provider: function() {
				return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/d421a24730e0446ea8c7f6a0ff0b68a0",2)
			},
			network_id: 3
		}*/
    },
    solc: {
        optimizer: {
            enabled: true,
            runs: 200
        }
    }
};