pragma solidity >=0.5.0 <0.6.0;

import "../adds/safemath.sol";

contract CornShop {
    using SafeMath for uint256;
    using SafeMath32 for uint32;
    using SafeMath16 for uint16;

    event NewShop(uint shopId, uint pattern);

    uint patternDigits = 16;
    uint patternModulus = 10 ** patternDigits;

    struct Shop {
        uint inventorySize;
        uint pattern;
        bool firstBought;
    }

    Shop[] shops;

    mapping (uint => address) public shopToOwner;
    mapping (address => uint) ownerShopCount;

    function createShop() public {
        uint id = shops.push(Shop(8, 0, false)) - 1;
        shopToOwner[id] = msg.sender;
        ownerShopCount[msg.sender] = ownerShopCount[msg.sender].add(1);
        emit NewShop(id, 0);
    }
}