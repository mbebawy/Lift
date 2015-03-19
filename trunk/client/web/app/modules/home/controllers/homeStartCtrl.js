/**
 * Created by MINA on 3/18/2015.
 */
angular.module("home").controller("homeStartCtrl", ["$scope","events", function($scope, events){
    var self = this;
    $scope.views = [{
        url: "modules/users/views/usersView.html",
        name: "Users"
    }];
    $scope.selectedView = null;
    var init = function(){

    };
    $scope.viewSelected = function(view){
        $scope.selectedView = view;
        events.publishEvent("mainContentViewChanged", view);
    };

    init();
}]);
