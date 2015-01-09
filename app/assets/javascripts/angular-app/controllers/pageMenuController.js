angular
  .module('r3act')

  .controller('PageMenuController', 
    function($rootScope, $scope, $route, $routeParams, Restangular) {

      $scope.navs = [
        {name: "Media Plan",  url: "media_plan" },
        {name: "Analytics",   url: " " },
        {name: "Trafficking", url: "trafficking" },
        {name: "Wrap Up",     url: "wrap_up" }
      ];

      $scope.settings = [
        {name: "Profile"},
        {name: "Company"}
      ];

  });