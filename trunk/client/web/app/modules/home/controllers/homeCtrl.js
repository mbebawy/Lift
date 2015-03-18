angular.module("home").controller("homeCtrl",["$scope", "security", function($scope, security){
    var init = function(){
        $scope.views = [{
                url: "modules/login/views/loginView.html"
            },
            {
                url:"modules/home/views/homeStartView.html"
            }];
        $scope.activeView = $scope.views[0];

        $scope.$watch(function(){
            return security.token;
        }, function(oldVal, newVal){
            if(newVal !== oldVal && security.token !== null){
                $scope.activeView = $scope.views[1];
            }
        }, true);
    };


    init();
	
}]);