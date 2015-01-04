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

    // Get One Campaign
    Restangular.one('campaigns', $routeParams.id).get().then(function(campaign){
      $scope.campaign = campaign;
    });
    
    // Get All Ad Tags For Current Campaign
    $scope.adTags = Restangular.one('campaigns', $routeParams.id).getList('ad_tags').$object;
    
    // Save/Update Campaign Attributes
    var saveCampaign = function(data) {
      $scope.campaign.save();
    }
    $scope.saveCampaign = saveCampaign;

  });