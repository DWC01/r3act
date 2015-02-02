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
      $scope.mediaPartners = campaign.ad_tag_receivers;
    });
     
    Campaign.ad_tags(id).then(function(ad_tags) {
      $scope.adTags = ad_tags;
    });

    $scope.isActive = function(route) {
      return route === $location.path();
    }

  });