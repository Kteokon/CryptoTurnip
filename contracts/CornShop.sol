pragma solidity >=0.5.0 <0.6.0;

import "../adds/safemath.sol";

contract CornShop {
    using SafeMath for uint256;
    using SafeMath32 for uint32;
    using SafeMath16 for uint16;

    uint minBoughtPrice = 0.001 ether;
    uint maxBoughtPrice = 0.002 ether;

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

    constructor() public {
        
    }

    function buyCorn() public {
        
    }

    function sellCorn() public {
        
    }
}