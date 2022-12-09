// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
Make a smart contract to add token to different slabs.
1. Define 5 slabs with capacity for each [say Slab0....Slab4 having 100,200,300,400 and
500 as capacity]
2. When a ERC20 token of specific type is deposited, it occupies the highest level and if
the capacity reaches the maximum, it goes to the next lower level
3. When the depositor enquires, it states which slab the deposit is.
*/

contract Token {

	
	uint256 public slab0;
	uint256 public slab1;
	uint256 public slab2;
	uint256 public slab3;
	uint256 public slab4;
	uint256 public slab0Capacity = 100;
	uint256 public slab1Capacity = 200;
	uint256 public slab2Capacity = 300;
	uint256 public slab3Capacity = 400;
	uint256 public slab4Capacity = 500;

	// deposit function. This function will deposit the token in the highest slab

	function deposit(uint256 _amount) public {
		// check which slab is empty and deposit the token in that slab
		if (slab0 < slab0Capacity) {
			slab0 += _amount;
			// check if the slab is full and deposit the token in the next slab
		} else if (slab1 < slab1Capacity) {
			slab1 += _amount;
		} else if (slab2 < slab2Capacity) {
			slab2 += _amount;
		} else if (slab3 < slab3Capacity) {
			slab3 += _amount;
		} else if (slab4 < slab4Capacity) {
			slab4 += _amount;
		}
	}

	// check slab function. This function will check which slab the token is deposited in

	function checkSlab() public view returns (string[] memory) {
		string[] memory slabs = new string[](5);
		if (slab0 > 0) {
			slabs[0] = "Slab0";
		} else if (slab1 > 0) {
			slabs[1] = "Slab1";
		} else if (slab2 > 0) {
			slabs[2] = "Slab2";
		} else if (slab3 > 0) {
			slabs[3] = "Slab3";
		} else if (slab4 > 0) {
			slabs[4] = "Slab4";
		}
		return slabs;
	}
	// withdraw function. This function will withdraw the token from the slab

	function withdraw(uint256 _amount) public {
		if (slab0 > 0) {
			slab0 -= _amount;
		} else if (slab1 > 0) {
			slab1 -= _amount;
		} else if (slab2 > 0) {
			slab2 -= _amount;
		} else if (slab3 > 0) {
			slab3 -= _amount;
		} else if (slab4 > 0) {
			slab4 -= _amount;
		}
	}

	// check balance function. This function will check the total balance in all the slabs

	function checkBalance() public view returns (uint256) {
		return slab0 + slab1 + slab2 + slab3 + slab4;
	}

	

	function checkSlab0() public view returns (uint256) {
		return slab0;
	}

	function checkSlab1() public view returns (uint256) {
		return slab1;
	}

	function checkSlab2() public view returns (uint256) {
		return slab2;
	}

	function checkSlab3() public view returns (uint256) {
		return slab3;
	}

	function checkSlab4() public view returns (uint256) {
		return slab4;
	}

	

	function checkSlab0Capacity() public view returns (uint256) {
		return slab0Capacity;
	}

	function checkSlab1Capacity() public view returns (uint256) {
		return slab1Capacity;
	}

	function checkSlab2Capacity() public view returns (uint256) {
		return slab2Capacity;
	}

	function checkSlab3Capacity() public view returns (uint256) {
		return slab3Capacity;
	}

	function checkSlab4Capacity() public view returns (uint256) {
		return slab4Capacity;
	}

	function checkSlab0Remaining() public view returns (uint256) {
		return slab0Capacity - slab0;
	}

	function checkSlab1Remaining() public view returns (uint256) {
		return slab1Capacity - slab1;
	}

	function checkSlab2Remaining() public view returns (uint256) {
		return slab2Capacity - slab2;
	}

	function checkSlab3Remaining() public view returns (uint256) {
		return slab3Capacity - slab3;
	}

	function checkSlab4Remaining() public view returns (uint256) {
		return slab4Capacity - slab4;
	}

	function checkSlab0Percentage() public view returns (uint256) {
		return (slab0 * 100) / slab0Capacity;
	}

	function checkSlab1Percentage() public view returns (uint256) {
		return (slab1 * 100) / slab1Capacity;
	}

	function checkSlab2Percentage() public view returns (uint256) {
		return (slab2 * 100) / slab2Capacity;
	}

	function checkSlab3Percentage() public view returns (uint256) {
		return (slab3 * 100) / slab3Capacity;
	}

	function checkSlab4Percentage() public view returns (uint256) {
		return (slab4 * 100) / slab4Capacity;
	}

	function checkSlab0PercentageRemaining() public view returns (uint256) {
		return ((slab0Capacity - slab0) * 100) / slab0Capacity;
	}

	function checkSlab1PercentageRemaining() public view returns (uint256) {
		return ((slab1Capacity - slab1) * 100) / slab1Capacity;
	}

	function checkSlab2PercentageRemaining() public view returns (uint256) {
		return ((slab2Capacity - slab2) * 100) / slab2Capacity;
	}

	function checkSlab3PercentageRemaining() public view returns (uint256) {
		return ((slab3Capacity - slab3) * 100) / slab3Capacity;
	}

	function checkSlab4PercentageRemaining() public view returns (uint256) {
		return ((slab4Capacity - slab4) * 100) / slab4Capacity;
	}

	function checkSlab0PercentageFull() public view returns (uint256) {
		return 100 - ((slab0 * 100) / slab0Capacity);
	}

	function checkSlab1PercentageFull() public view returns (uint256) {
		return 100 - ((slab1 * 100) / slab1Capacity);
	}

	function checkSlab2PercentageFull() public view returns (uint256) {
		return 100 - ((slab2 * 100) / slab2Capacity);
	}

	function checkSlab3PercentageFull() public view returns (uint256) {
		return 100 - ((slab3 * 100) / slab3Capacity);
	}

	function checkSlab4PercentageFull() public view returns (uint256) {
		return 100 - ((slab4 * 100) / slab4Capacity);
	}

	function checkSlab0PercentageFullRemaining() public view returns (uint256) {
		return 100 - (((slab0Capacity - slab0) * 100) / slab0Capacity);
	}

	function checkSlab1PercentageFullRemaining() public view returns (uint256) {
		return 100 - (((slab1Capacity - slab1) * 100) / slab1Capacity);
	}

	function checkSlab2PercentageFullRemaining() public view returns (uint256) {
		return 100 - (((slab2Capacity - slab2) * 100) / slab2Capacity);
	}

	function checkSlab3PercentageFullRemaining() public view returns (uint256) {
		return 100 - (((slab3Capacity - slab3) * 100) / slab3Capacity);
	}

	function checkSlab4PercentageFullRemaining() public view returns (uint256) {
		return 100 - (((slab4Capacity - slab4) * 100) / slab4Capacity);
	}
	

}
































