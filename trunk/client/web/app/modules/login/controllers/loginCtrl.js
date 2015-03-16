angular.module('login').controller('loginCtrl', ["$scope", function($scope){
	$scope.userName = "tMina";

	$scope.login = function(){
		alert("login clicked, hello Mina")
	}
}])