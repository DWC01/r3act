angular
  .module('r3act')
  .controller('AnalyticsController', 
    function( $scope ) {
    $scope.dash = {
      view: 'Pacing'
    };
    $scope.random = 'Random';
  });