angular
  .module('r3act')

  .controller('CampaignsController', 
    function($rootScope, $scope, $route, $routeParams, Restangular) {
    // Set Base (Route Object)
    var baseCampaigns = Restangular.all('campaigns');
    
    // Get All Campaigns
    baseCampaigns.getList().then(function(campaigns) {
      $scope.campaigns = campaigns;
    });
});