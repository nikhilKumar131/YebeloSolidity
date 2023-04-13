// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./erc20.sol";

contract main{
    token Token;

    constructor(address _addr){
        Token = token(_addr);
    }
    
//each slab is a uint
//here we are packing the variables.
//uint8 and uint32 actually increases the gas.
    uint64 slab0;
    uint64 slab1;
    uint64 slab2;
    uint64 slab3;
    uint64 slab4;
    uint64 lastBalance = 0;
    string currentSlab;
    


    function checkSlab() public returns(  string memory ){
        if(Token.balanceOf(address(this)) == lastBalance){
            return currentSlab;
        }
        else{
            setSlab();
            return currentSlab;
        }
    }

    function setSlab() internal {
        uint _lastBalance = lastBalance;
        if(_lastBalance <= 100){
            currentSlab = "slab0";
        }
        else if(lastBalance <= 200){
            currentSlab = "slab1";
        }
        else if(lastBalance <= 300){
            currentSlab = "slab2";
        }
        else if(lastBalance <= 400){
            currentSlab = "slab3";
        }
        else if(lastBalance <= 500){
            currentSlab = "slab4";
        }
        else {
            currentSlab = "balance crossed all slabs";
        }
    }
}
