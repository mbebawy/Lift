angular.module("home").controller("homeCtrl",["$scope", "security","events", function($scope, security, events){
    var self = this;
    self.historyViews = [];
    var init = function(){

        $scope.views = [{
                url: "modules/login/views/loginView.html",
                displayName: "login"
            },
            {
                url:"modules/home/views/homeStartView.html",
                displayName: "Home"
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
            self.historyViews.push(angular.copy($scope.activeView));
            $scope.activeView = view;
        })
    };

     $scope.ddSelectOptions = [
        {
            text: 'Option1',
            value: 'a value'
        },
        {
            text: 'Option2',
            value: 'another value',
            someprop: 'somevalue'
        },
        {
            // Any option with divider set to true will be a divider
            // in the menu and cannot be selected.
            divider: true
        },
        {
            // Any divider option with a 'text' property will
            // behave similarly to a divider and cannot be selected.
            divider: true,
            text: 'divider label'
        },
        {
            // Example of an option with the 'href' property
            text: 'Option4',
            href: '#option4'
        }
    ];
    $scope.viewOptionClicked = function(op){
        op.value();
    }

    $scope.ddSelectSelected = {};
    
    $scope.onBack = function(){
        $scope.activeView = self.historyViews[self.historyViews.length-1];
        self.historyViews.splice(1, self.historyViews.length-1)
    }

    init();
	
}]);