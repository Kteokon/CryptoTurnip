pragma solidity >=0.5.0 <0.6.0;

contract CornFactory {

    enum Status {
        Fresh,
        Rotten
    }

    struct Corn {
        Status status;
        uint boughtDate;
    }

    Corn[] corns;

    function changeToRotten(uint _id) public {
        require (block.timestamp - corns[_id].boughtDate >= 7 days);
        corns[_id].status = Status.Rotten;
    }
}