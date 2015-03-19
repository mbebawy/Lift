angular.module("users").controller("usersCtrl", ["$scope", "usersServiceAgent", function($scope, usersServiceAgent){
    $scope.searchKeyword = null;
    $scope.users = [];
    $scope.selectedUser = null;
    var init = function(){

    };
    $scope.searchUsers = function(){
        if($scope.searchKeyword.length > 3){
            usersServiceAgent.getUsers($scope.searchKeyword).then(function(users){
                $scope.users = users;
            }, function(error){

            })
        }

    };
    $scope.userSelected = function(user){
        $scope.selectedUser = user;
    };
    init();

}]);