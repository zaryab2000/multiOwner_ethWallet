// pragma solidity >= 0.5.0 < 0.7.0;
pragma solidity ^0.5.0;


contract Wallet{
  uint storedData;
  uint _myVal;

  constructor(){
  	_myVal =100;
  }

  function set(uint x) public {
    storedData = x;
  }

  function  getMyVal() public view returns(uint){
  	return _myVal;
  }
  
  function get() public view returns (uint) {
    return storedData;
  }
}