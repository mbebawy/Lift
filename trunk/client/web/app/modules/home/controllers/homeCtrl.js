angular.module("home").controller("homeCtrl",["$scope", "security","events", function($scope, security, events){
    var init = function(){
        $scope.views = [{
                url: "modules/login/views/loginView.html"
            },
            {
                url:"modules/home/views/homeStartView.html"
            }];
        $scope.activeView = $scope.views[0];
        $scope.prevView = null;

        $scope.$watch(function(){
            return security.token;
        }, function(oldVal, newVal){
            if(newVal !== oldVal && security.token !== null){
                $scope.activeView = $scope.views[1];
            }
        }, true);
        events.subscribeToEvent($scope, "mainContentViewChanged", function(view){
            $scope.prevView = angular.copy($scope.activeView);
            $scope.activeView = view;
        })
    };


    init();
	
}]);