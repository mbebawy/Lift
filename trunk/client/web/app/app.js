'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngRoute',
  'myApp.version',

  'login',
  'common',
    'home',
    'users'
]).
config(['$routeProvider', function($routeProvider) {
	  $routeProvider.when('/', { templateUrl:'modules/home/views/homeView.html'});

 
}]);
