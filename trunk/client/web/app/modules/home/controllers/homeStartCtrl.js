/**
 * Created by MINA on 3/18/2015.
 */
angular.module("home").controller("homeStartCtrl", ["$scope","events", function($scope, events){
    var self = this;
    
    $scope.selectedView = null;
    var init = function(){
        self.usersView = {
            url: "modules/users/views/usersView.html",
            name: "Users",
            viewOptions: [{text:'Add User', value: addNewUser}]
        };
        $scope.views = [self.usersView];
    };
    $scope.viewSelected = function(view){
        $scope.selectedView = view;
        events.publishEvent("mainContentViewChanged", view);
    };
    var addNewUser = function(){
       
       var view = {
                url: "modules/users/views/editUserView.html",
                displayName: "Add User"
            };
        events.publishEvent("mainContentViewChanged", view);
    }

    init();
}]);
