angular
  .module('r3act')

  .controller('CampaignController', 
    function($scope, $routeParams, $stateParams,
             Restangular, Campaign ) {
    
    var id = $stateParams.id;

    $scope.currentId = id;
    $scope.trafficking  = 'untrafficked';

    Campaign.all().then(function(campaigns) {
      $scope.campaigns = campaigns;
    });

    Campaign.find(id).then(function(campaign) {
      $scope.campaign = campaign;
    });
     
    Campaign.flights(id).then(function(flights) {
      $scope.flights = flights;
    });

    $scope.isActive = function(route) {
      return route === $location.path();
    }

  });