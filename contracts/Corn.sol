pragma solidity >=0.5.0 <0.6.0;
pragma experimental ABIEncoderV2;

contract CornFactory {

    enum Status {
        Fresh,
        Rotten
    }

    struct Corn {
        Status status;
        uint boughtDate;
    }

    function changeToRotten(Corn memory corn) public view {
        require (block.timestamp - corn.boughtDate >= 7 days);
        corn.status = Status.Rotten;
    }
}