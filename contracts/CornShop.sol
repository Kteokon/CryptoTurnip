pragma solidity >=0.5.0 <0.6.0;

import "../adds/safemath.sol";

contract CornShop {
    using SafeMath for uint256;
    using SafeMath32 for uint32;
    using SafeMath16 for uint16;

    uint coeff = 0.00001 ether;
    uint price;

    uint randNonce = 0;
    string pattern;
    mapping (string => uint) patternToPrecent;
    mapping (uint => string) idToPattern;

    mapping (uint => address) public shopToOwner;
    mapping (address => uint) ownerShopCount;

    constructor() public {
        pattern = "nothing";
        
        idToPattern[0] = "random";
        idToPattern[1] = "small";
        idToPattern[2] = "big";
        idToPattern[3] = "decreasing";
        precentsToNormal();
        changePattern();
    }

    function buyCorn(uint amountOfCorn) public payable { // фукнция покупки кукурузы
        require(msg.value == amountOfCorn * price);
        // Найти инвентарь пользователя и закинуть кукурузу
    }

    function sellCorn(uint amountOfCorn) public payable { // Функция продажи кукурузы
        require(msg.value == amountOfCorn * price);
        // Найти инвентарь пользователя и убрать кукурузу
    }

    function getPrice() private view returns (uint) { // Цена покупки кукурузы варьируется от 0.001 до 0.002
        return price;
    }

    function generateBoughtPrice() private { // Цена покупки кукурузы варьируется от 0.001 до 0.002
        price = (_generateRandomNum(100) + 100) * coeff;
    }

    function generateSellPrice() private  { // Цена покупки кукурузы варьируется от 0.001 до 0.002
        if (_compareStrings(pattern, "random")) {
            price = (_generateRandomNum(110) + 90) * coeff;
        }
        else {
            if (_compareStrings(pattern, "small")) {
                price = (_generateRandomNum(260) + 90) * coeff;
            }
            else {
                if (_compareStrings(pattern, "big")) {
                    price = (_generateRandomNum(410) + 90) * coeff;
                }
                else {
                    if (_compareStrings(pattern, "decreasing")) {
                        price = (_generateRandomNum(70) + 30) * coeff;
                    }
                }
            }
        }
    }

    function precentsToNormal() private {
        patternToPrecent["random"] = 35;
        patternToPrecent["small"] = 25;
        patternToPrecent["big"] = 25;
        patternToPrecent["decreasing"] = 15;
    }

    function changePattern() public {
        if (!_compareStrings(pattern, "nothing")) { // Отнимаем вероятность у паттерна, который был на этой неделе
            for (uint i = 0; i < 4; i++) {
                string memory p = idToPattern[i];
                if (_compareStrings(pattern, p)) {
                    patternToPrecent[pattern] -= 9;
                }
                else {
                    patternToPrecent[p] += 3;
                }
            }
        }

        uint rand = _generateRandomNum(100); // Случайный выбор паттерна
        for (uint i = 0; i < 4; i++) {
            string memory p = idToPattern[i];
            uint pr = patternToPrecent[p];
            if (pr < rand) {
                rand -= pr;
            }
            else {
                pattern = p;
                break;
            }
        }
        precentsToNormal();
        generateSellPrice();
    }

    function _generateRandomNum(uint _modulus) internal returns (uint) {
        randNonce = randNonce.add(1);
        return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
    }

    function _compareStrings(string memory a, string memory b) private pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
}