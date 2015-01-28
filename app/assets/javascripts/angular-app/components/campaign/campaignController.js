angular
  .module('r3act')

  .controller('CampaignController', 
    function($rootScope, $scope, $route, $routeParams, 
             $stateParams, Restangular, $http) {

    $routeParams.id = $stateParams.id;

    $scope.isActive = function(route) {
        return route === $location.path();
    };

    $scope.trafficking  = 'untrafficked';
    
    // Set Base (Route Object)
    var baseCampaigns = Restangular.all('campaigns');
    
    // Get All Campaigns
    baseCampaigns.getList().then(function(campaigns) {
      $scope.campaigns = campaigns;
    });

    // Get One Campaign
    Restangular.one('campaigns', $routeParams.id).get().then(function(campaign){

      $scope.campaign = campaign;

      // Get Media Partners Array
      $scope.mediaPartners = $scope.campaign.ad_tag_receivers;

    });
    
    // Get All Ad Tags For Current Campaign
    $scope.adTags = Restangular.one('campaigns', $routeParams.id).getList('ad_tags').$object;
  });