angular.module("users").controller("usersCtrl", ["$scope", "usersServiceAgent", "events", function($scope, usersServiceAgent, events){
    $scope.searchKeyword = null;
    $scope.users = [];
    $scope.selectedUser = null;
    $scope.firstName= null;
    $scope.lastName= null;
    var init = function(){

    };
    $scope.searchUsers = function(){
        
        var args={
            lastName: $scope.lastName,
            firstName: $scope.firstName
        }
        usersServiceAgent.getUsers(args).then(function(users){
            $scope.users = users;
        }, function(error){

        })
        

    };
    $scope.userSelected = function(user){
        $scope.selectedUser = user;
    };
    $scope.addUser = function(){
        var view = {
                url: "modules/users/views/editUserView.html",
                displayName: "Add User"
            };
        events.publishEvent("mainContentViewChanged", view);
    };
    init();

}]);