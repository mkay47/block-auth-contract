pragma solidity ^0.5.0;

contract Authentication{

	event LoggedIn(string username,string password);
	event Message(address _receiver, string message);

	function Login(string memory username,string memory password) public {
		emit LoggedIn(username,password);
	}

	function SendToken(address account,string memory message) public {
		emit Message(account,message);
	}
}