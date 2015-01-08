angular
  .module('r3act')

  .controller('DashboardsController', 
    function($rootScope, $scope, $route, $routeParams,
             $stateParams, Restangular) {
      
    $routeParams.id = $stateParams.id   

    // Set Base (Route Object)
    var baseCampaigns = Restangular.all('campaigns');

    // Get One Campaign
    Restangular.one('campaigns', $routeParams.id).get().then(function(campaign){
      $scope.campaign = campaign;
    });

  });