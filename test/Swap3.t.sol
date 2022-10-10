// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


import "../lib/forge-std/src/Test.sol";
import "../lib/forge-std/src/console.sol";
import "../src/Swap3.sol";

address constant USDT = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
address constant DaiHolder = 0x1B7BAa734C00298b9429b518D621753Bb0f6efF2;
address constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

contract UniswapV2ThirdTest is Test{
       UniswapV2Third private uni;
function setUp() public {
    uni = new UniswapV2Third();
}
function testSwap() public {

    vm.startPrank(DaiHolder);
    uint amountIn = 100e18;
    uint amountOutMin = 1;
    address tokenIn = DAI;
    address tokenOut = USDT;

    IERC20(tokenIn).approve(address(uni), amountIn);
    uni.swap(tokenIn, tokenOut, amountIn, amountOutMin);

    IERC20(tokenOut).balanceOf(msg.sender);

    vm.stopPrank();

}
}