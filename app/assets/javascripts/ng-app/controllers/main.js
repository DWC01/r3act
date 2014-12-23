angular
  .module('app')
  .controller('MainCtrl', ['Dashboard', '$scope', '$routeParams',
    function(Dashboard, $scope, $routeParams) {
      
      $scope.dashboards = Dashboard.query();
      
      $scope.dashboard = new Dashboard();
      
      $scope.save = function() {
        $scope.dashboard.$save();
        $scope.dashboards.push($scope.dashboard);
        $scope.dashboard = new Dashboard();
      }

      $scope.delete = function(dashboard){
        Dashboard.delete(dashboard);
        _.remove($scope.dashboards, dashboard)
      }

  }]);