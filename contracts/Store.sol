pragma solidity >=0.5.0 <0.6.0;

import "./Corn.sol";

contract CornStore {

    struct Store{
        uint storeSize;
        Corn[] necs;
    }

    Store[] public stores;

    mapping (uint => address) public storeToOwner;
    mapping (address => uint) ownerStoreCount;

    function _createStore() public {
        require(ownerStoreCount[msg.sender] == 0);
        Store memory st;
        st.storeSize = 9; 
        uint id = stores.push(st);
        storeToOwner[id] = msg.sender;
        ownerStoreCount[msg.sender]++;
    }

    function putCorn(uint _storeId, uint cornCount, Corn[] memory _corn) internal {
        require(msg.sender == storeToOwner[_storeId]);
        require(stores[_storeId].necs.length + cornCount <= stores[_storeId].storeSize);
        for (uint i = 0; i < _corn.length; i++) {
            stores[_storeId].necs.push(_corn[i]);
        }
        
    }

    function takeCorn(uint _storeId, uint cornCount) internal {
        require(msg.sender == storeToOwner[_storeId]);
        stores[_storeId].necs.length -= cornCount;
    }

}