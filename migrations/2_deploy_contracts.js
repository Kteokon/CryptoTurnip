var Corn = artifacts.require("./CornFactory.sol")
var Store = artifacts.require("./CornStore.sol")
var CornShop = artifacts.require("./CornShop.sol")

module.exports = function(deployer) {
    deployer.deploy(Corn);
    deployer.deploy(Store);
    deployer.deploy(CornShop);
};