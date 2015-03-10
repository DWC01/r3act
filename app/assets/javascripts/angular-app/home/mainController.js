angular
  .module('r3act')

  .controller('MainController', function($scope, $route, $routeParams, $location) {
     $scope.$route = $route;
     $scope.$location = $location;
     $scope.$routeParams = $routeParams;

     toggleSidebar = function() {
        $('.sidebar').toggleClass('show-sidebar');
      }
      $scope.toggleSidebar = toggleSidebar;
 });