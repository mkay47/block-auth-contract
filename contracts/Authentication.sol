pragma solidity ^0.5.0;

contract Authentication{

	event LoggedIn(string username,string password);

	function Login() public {
		emit LoggedIn("hllo","qweqw");
	}
}