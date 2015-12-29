/**
 * Created by MINA on 4/4/2015.
 */
angular.module("users").controller("userDetailsCtrl", ["$scope", "usersServiceAgent", "events", function($scope, usersServiceAgent, events){
   
	$scope.user = {};
	$scope.address = {};
	var self = this;
	 $scope.dateOptions = {
						    changeYear: true,
						    changeMonth: true,
						    yearRange: '1900:-0'
						   };
	self.isNewUser = true;

    $scope.init = function(view){
    	var user = view.payload;
    	if(user !== undefined && user !== null){
			$scope.user = user;
			self.isNewUser = false;
			$scope.address = user.address[0];
		}
		else{
			self.isNewUser = true;
		}
    };
    $scope.save = function(){
    	var user = angular.copy($scope.user);
    	user.address = [$scope.address];
    	if(self.isNewUser){
			usersServiceAgent.createUser(user).then(function(result){
				var usersView = {
	            		url: "modules/users/views/usersView.html",
	            		name: "Users",
	            		viewOptions: [{text:'Add User', value: $scope.addUser}]
	        		};
	        		events.publishEvent("mainContentViewChanged", usersView);

			}, function(error){

			})
		}
		else{
			usersServiceAgent.updateUser(user).then(function(result){
				var usersView = {
	            		url: "modules/users/views/usersView.html",
	            		name: "Users",
	            		viewOptions: [{text:'Add User', value: $scope.addUser}]
	        		};
	        		events.publishEvent("mainContentViewChanged", usersView);

			}, function(error){

			})
		}
    };
    $scope.addUser = function(){
        var view = {
                url: "modules/users/views/editUserView.html",
                displayName: "Add User"
            };
        events.publishEvent("mainContentViewChanged", view);
    };

}]);
