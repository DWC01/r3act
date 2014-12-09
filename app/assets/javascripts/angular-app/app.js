angular
  .module('app', ['ngRoute', 'ngResource'])
  .config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/', {
      controller: 'HomeCtrl'
    }).when('/:id', {
      controller: 'HomeCtrl',
    }).otherwise({
      redirectTo: '/'
    });
  }]);

