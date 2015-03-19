'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngRoute',
  'myApp.version',
  'mobile-angular-ui',
  'mobile-angular-ui.core.capture',
  'login',
  'common',
    'home',
    'users'
]).
config(['$routeProvider', function($routeProvider) {
	  $routeProvider.when('/', { templateUrl:'modules/home/views/homeView.html'});

 
}]);
