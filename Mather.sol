//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Mather{
    uint256 public minimumUsd = 50;

    function fund() public payable{
        require(msg.value>=minimumUsd, "Didn't send enough!");


    }

    // function getPriceOfEth() public view returns(uint256) {
    //     AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    //     (, int price,,,)= priceFeed.latestRoundData(); 
    //     return uint256(price*1e10);
    // }

    uint256 priceOfEth =1837846300000000000000;
                        // 1000000000000000000

    function getEthToUsd(uint256 _eth) public view returns(uint256){
        uint256 rate = priceOfEth;
        uint256 ethAmountInUsd = (rate*_eth)/1e18;
        return ethAmountInUsd;

        //.0005441

    }


    function getUsdToEth(uint256 _usd) public view returns(uint256){
        uint256 rate = 1e30/priceOfEth;
        uint256 usdAmountInEth = (rate*_usd)/1e5;

        //should be further divided by 1e7 but I won't do that here in the contract because solidity will mess with it
        return usdAmountInEth;
    }

    // function getVersion() public view returns(uint256){
    //     AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    //     return priceFeed.version();

    //     //1837846300000000000000
    // }

    



}

