angular
  .module('r3act')
  .directive('sidebar', function(){
    return {
      retrict: 'E',
      templateUrl: 'sidebars/sidebar_directive.html'
    }
  })
  .controller('SidebarController', 
    function($scope, $stateParams, Restangular) {

      $scope.currentId = $stateParams.id;

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