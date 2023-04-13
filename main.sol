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
    uint slab0;
    uint slab1;
    uint slab2;
    uint slab3;
    uint slab4;
    uint  lastBalance = 0;
    string  currentSlab = "slab0";
    

    //update the balance before checking it.
    function checkSlab() public view returns(string memory){
        return currentSlab;
    }


    //updateSlab function checks if balance is changed since last check, if changed, it updates the new balance.
    function updateSlab() public {

       if(Token.balanceOf(address(this)) != lastBalance){
            lastBalance = Token.balanceOf(address(this));
            setSlab();
            
        }
    }


    //setSlab is internal function 
    //it checks updates currentSlab and slab balance;
    //Note: Previous slab is not changed to zero, as its value not visible and would cost gas only.
    function setSlab() internal {
        uint _lastBalance = lastBalance;
        if(_lastBalance <= 100){
            currentSlab = "slab0";
            slab0 = _lastBalance;
        }
        else if(lastBalance <= 200){
            currentSlab = "slab1";
            slab1 = _lastBalance;
        }
        else if(lastBalance <= 300){
            currentSlab = "slab2";
            slab2 = _lastBalance;
        }
        else if(lastBalance <= 400){
            currentSlab = "slab3";
            slab3 = _lastBalance;
        }
        else if(lastBalance <= 500){
            currentSlab = "slab4";
            slab4 = _lastBalance;
        }
        else {
            currentSlab = "balance crossed all slabs";
        }
    }

}
