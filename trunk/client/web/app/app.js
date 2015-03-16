'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngRoute',
  'myApp.version',
  'mobile-angular-ui',
  'mobile-angular-ui.core.capture',
  'login'
]).
config(['$routeProvider', function($routeProvider) {
	  $routeProvider.when('/', { templateUrl:'modules/login/views/loginView.html'}).
            /*when('/edit/:projectId', {controller:EditCtrl, templateUrl:'detail.html'}).
            when('/new', {controller:CreateCtrl, templateUrl:'detail.html'}).*/
            otherwise({redirectTo:'/', templateUrl:'modules/login/views/loginView.html'});
 
}]);
