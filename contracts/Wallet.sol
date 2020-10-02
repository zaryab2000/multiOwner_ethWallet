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

	event RequestCreated(address indexed _owner,address indexed _receiver, uint256 _value, uint indexed transactionIndex);
	

	modifier ownerOnly(){ 
		require(checkOwnership[msg.sender],"Caller is NOT the Owner"); 
		_; 
	}
	

	function createRequest(uint256 _value, address _rec, string memory _reason) public ownerOnly{
		uint transactionIndex = transactionReqs.length;

		transactionReqs.push(TxnRequest({
			value : _value,
			votesReceived : 0,
			requestBy : msg.sender,
			recipient : _rec,
			isExecuted : false,
			reason : _reason
			}));

		emit RequestCreated(msg.sender, _rec, _value, transactionIndex);
	}
	



	
}