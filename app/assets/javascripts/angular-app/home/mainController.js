angular
  .module('r3act')

  .controller('MainController', function($scope, $route, $routeParams, $location) {
     $scope.$route = $route;
     $scope.$location = $location;
     $scope.$routeParams = $routeParams;

     toggleSidebar = function() {
        $('.sidebar').toggleClass('show-sidebar');
        $('.page-content-wrap').toggleClass('sidebar-push-content');
      }
      $scope.toggleSidebar = toggleSidebar;
 });