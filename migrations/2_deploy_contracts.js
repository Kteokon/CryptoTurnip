var CornShop = artifacts.require("./CornShop.sol")
var Corn = artifacts.require("./Corn.sol")
var Bank = artifacts.require("./Bank.sol")
var Store = artifacts.require("./Store.sol")

module.exports = function(deployer) {
    deployer.deploy(CornShop);
    deployer.deploy(Corn);
    deployer.deploy(Bank);
    deployer.deploy(Store);
};