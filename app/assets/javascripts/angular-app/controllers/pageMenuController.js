angular
  .module('r3act')

  .controller('PageMenuController', 
    function($rootScope, $scope, $route, $routeParams, Restangular) {

      $scope.plans = [
        {name: "Media Partners"},
        {name: "Placements"},
        {name: "Budgets / Pacing"}
      ];

      $scope.traffics = [
        {name: "Traffic Tags"}
      ];

      $scope.dashboards = [
        {name: "Performance"},
        {name: "Pacing"},
        {name: "Discrepancies"}
      ];

  });