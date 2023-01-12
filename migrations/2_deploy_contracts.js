var Corn = artifacts.require("./CornFactory.sol")
var Store = artifacts.require("./CornStore.sol")
var CornShop = artifacts.require("./CornShop.sol")
// var Bank = artifacts.require("./Bank.sol")
// var BankInterface = artifacts.require("./BankInterface.sol")

module.exports = function(deployer) {
    deployer.deploy(Corn);
    deployer.deploy(Store);
    deployer.deploy(CornShop);
    // deployer.deploy(Bank);
    // deployer.deploy(BankInterface);
};