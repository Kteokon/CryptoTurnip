pragma solidity >=0.5.0 <0.6.0;

import "./CornFactory.sol";

contract CornStore is CornFactory {

    struct Store{
        uint storeSize;
        mapping(uint => Corn) necs;
        uint necsSize;
    }

    Store[] public stores;

    mapping (uint => address) public storeToOwner;
    mapping (address => uint) internal ownerToStore;
    mapping (address => uint) ownerStoreCount;

    function _createStore() public {
        require(ownerStoreCount[msg.sender] == 0);
        Store memory st;
        st.storeSize = 9;
        st.necsSize = 0;
        uint id = stores.push(st);
        ownerToStore[msg.sender] = id;
        storeToOwner[id] = msg.sender;
        ownerStoreCount[msg.sender]++;
    }

    function putCorn(uint _storeId, uint amountOfCorn) internal {
        require(msg.sender == storeToOwner[_storeId]);
        require(stores[_storeId].necsSize + amountOfCorn <= stores[_storeId].storeSize);
        uint date = block.timestamp + 8 hours; // День покупки
        date = date - (date % 1 days);
        Store storage st = stores[_storeId];
        for (uint i = 0; i < amountOfCorn; i++) {
            stores[_storeId].necs[st.necsSize] = Corn(Status.Fresh, date);
            st.necsSize++;
        }
    }

    function takeCorn(uint _storeId, uint amountOfCorn) internal {
        require(msg.sender == storeToOwner[_storeId]);
        require(canBeSold(_storeId) - amountOfCorn >= 0);
        Store storage st = stores[_storeId];
        for (uint i = 0; i < amountOfCorn; i++) {
            st.necsSize--;
            delete stores[_storeId].necs[st.necsSize];
        }
    }

    function canBeSold(uint _storeId) private view returns (uint) {
        Store storage st = stores[_storeId];
        uint freshCornCounter = 0;
        for (uint i = 0; i < st.necsSize; i++) {
            if (stores[_storeId].necs[i].status == Status.Fresh)
                freshCornCounter++;
        }
        return freshCornCounter;
    }

    function burnCorn(uint _storeId) public {
        require(msg.sender == storeToOwner[_storeId]);
        Store storage st = stores[_storeId];
        for (uint i = 0; i < stores[_storeId].necsSize; i++) {
            st.necsSize--;
            delete stores[_storeId].necs[st.necsSize];
        }
    }
}