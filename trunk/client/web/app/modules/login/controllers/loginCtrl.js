angular.module('login').controller('loginCtrl', ["$scope","tokenService", "security", function($scope, tokenService, security){
	$scope.userName = null;
	$scope.rememberMe = true;
	$scope.password = null;

	$scope.login = function(){
		tokenService.getToken($scope.userName, $scope.password).then(function(token){
			security.token = token;
			if(security.token !== null){

			}
		}, function(error){

		});
	}
}])