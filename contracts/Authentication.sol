pragma solidity ^0.5.0;

contract Authentication{

	event LoggedIn(string username,string password);

	function Login(string memory username,string memory password) public {
		
		emit LoggedIn(username,password);
	  }
}