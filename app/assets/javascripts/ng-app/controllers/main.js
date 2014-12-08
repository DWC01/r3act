angular
  .module('app')
  .controller('MainCtrl', ['Dashboard', '$scope', function(Dashboard, $scope){
      $scope.dashboard = "Heyooooo";
      $scope.hello     = "Hello World!"
    }]);
