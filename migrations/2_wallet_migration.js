var WalletMigation = artifacts.require("./Wallet.sol")

module.exports = function(deployer) {
	deployer.deploy(WalletMigation)
};
