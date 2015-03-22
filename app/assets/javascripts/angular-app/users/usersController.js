angular
  .module('r3act')

  .controller('UsersController', 
    function($scope, $routeParams, $stateParams,
             Restangular, User ) {
    
    var id = $stateParams.id;

    $scope.currentId = id;

    User.all().then(function(users) {
      $scope.users = users;
    });

    User.find(id).then(function(user) {
      $scope.user = user;
    });

    $scope.isActive = function(route) {
      return route === $location.path();
    }

  });