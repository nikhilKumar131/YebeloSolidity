// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract token is ERC20{
    //constructor
    constructor() ERC20("Yeb","YebS"){
    }

    //mint function so anyone can mint for free(for test projects only)
    function mint(uint _amt) public {
        _mint(msg.sender,_amt);
    }

}
