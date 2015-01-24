angular
  .module('r3act')
  .controller('SidebarController', 
    function($rootScope, $scope, $route, $routeParams, Restangular) {

      $scope.navs = [
        {name: 'Media Plan',  url: '' },
        {name: 'Trafficking', url: 'trafficking' },
        {name: 'Analytics',   url: 'analytics' },
        {name: 'Wrap Up',     url: 'wrap_up' }
      ];

      $scope.settings = [
        {name: 'Profile'},
        {name: 'Company'}
      ];      
  });