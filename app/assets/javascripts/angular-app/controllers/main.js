angular
  .module('app')
  .controller('MainCtrl', ['Dashboard', '$scope', '$routeParams',
    function(Dashboard, $scope, $routeParams) {
      
      $scope.dashboards = Dashboard.query();

    }]);
