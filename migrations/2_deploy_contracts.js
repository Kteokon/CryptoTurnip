var CornShop = artifacts.require("./CornShop.sol")

module.exports = function(deployer) {
    deployer.deploy(CornShop);
};