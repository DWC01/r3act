angular
  .module('r3act')

  .directive('sidebar', function(){
    return {
      retrict: 'E',
      templateUrl: 'sidebars/sidebar-directive.html'
    }
  })

  .controller('SidebarController', 
    function($rootScope, $scope, $route, $routeParams, Restangular) {
      var toggle;

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