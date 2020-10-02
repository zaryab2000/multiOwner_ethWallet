pragma solidity >= 0.5.0 < 0.7.0;


contract Wallet{
	uint8 public requiredVote;
	address[] public owners;

	mapping (address => bool) public checkOwnership;

	struct TxnRequest{
		uint256 value;
		uint8 votesReceived; 
		address requestBy;
		address recipient;
		bool isExecuted;
		string reason;
		mapping(address => bool) voted;
	}
	
	TxnRequest[] public transactionReqs;

	constructor(address[] memory _owners, uint8 _requiredVote) public{
		require (_owners.length > 0, "More than one Owner Required");
		require (_requiredVote > 0, "Cannot proceed with Single Vote Wallet");
		require (_requiredVote <= _owners.length, "Required Vote cannot be more than number of Owners");

		for(uint i=0; i<_owners.length; i++){
			address owner = _owners[i];
			require(owner != address(0), "Invalid Owner Passed");
			require (!checkOwnership[owner], "Owner Already Exists");

			checkOwnership[owner] = true;
			owners.push(owner);
		}
		requiredVote = _requiredVote;	
	}


	
}