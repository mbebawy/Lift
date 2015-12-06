/**
 * Created by MINA on 4/4/2015.
 */
angular.module("users").controller("userDetailsCtrl", ["$scope", "usersServiceAgent", function($scope, usersServiceAgent){
   
	$scope.user = {};
	var self = this;
	self.isNewUser = true;

    $scope.init = function(view){
    	var user = view.payload;
    	if(user !== undefined && user !== null){
			$scope.user = user;
			self.isNewUser = false;
		}
		else{
			self.isNewUser = true;
		}
    };
    $scope.save = function(){
		usersServiceAgent.createUser($scope.user).then(function(result){
			var usersView = {
            		url: "modules/users/views/usersView.html",
            		name: "Users",
            		viewOptions: [{text:'Add User', value: addNewUser}]
        		};
        		events.publishEvent("mainContentViewChanged", usersView);

		}, function(error){

		})
    };

}]);
