// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../main.sol";
import "../erc20.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {
    main public Main;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        Main = new main(0xd9145CCE52D386f254917e481eB44e9943F39138);
    }

    function checkSlab0() public {
        Main.mint(50);
        Main.updateSlab();
        Assert.equal(Main.checkSlab(), "slab0","slab should be equal to slab0");
    }

    function checkSlab1() public {
        Main.mint(100);
        Main.updateSlab();
        Assert.equal(Main.checkSlab(), "slab1","slab should be equal to slab1");
    }

    function checkSlab2() public {
        Main.mint(100);
        Main.updateSlab();
        Assert.equal(Main.checkSlab(), "slab2","slab should be equal to slab1");
    }

    function checkSlab3() public {
        Main.mint(100);
        Main.updateSlab();
        Assert.equal(Main.checkSlab(), "slab3","slab should be equal to slab1");
    }

    function checkSlab4() public {
        Main.mint(100);
        Main.updateSlab();
        Assert.equal(Main.checkSlab(), "slab4","slab should be equal to slab1");
    }

    function checkSlabOverflow() public {
        Main.mint(100);
        Main.updateSlab();
        Assert.equal(Main.checkSlab(), "balance crossed all slabs" ,"slab should be equal to slab1");
    }
    
}
    
