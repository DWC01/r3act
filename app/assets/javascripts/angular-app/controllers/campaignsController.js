// curl -X POST -H "application/json" -d '{"campaign":{"name":"CommandCo"}}' http://localhost:3000/api/campaigns 
angular
  .module('r3act')

  .controller('CampaignsController', ['Campaign', 'CampaignAdTag', '$scope', '$route', '$routeParams', 
    function(Campaign, CampaignAdTag, $scope, $route, $routeParams) {  

    // Add new campaign to DOM
    $scope.campaign = new Campaign();

    // Add campaign.all to DOM
    $scope.campaignAll = Campaign.query();
    $scope.campaignAdTagAll = CampaignAdTag.query();

    $scope.save = function(atts) {
      $scope.campaign.campaign = atts;
      $scope.campaign.$save();
      $scope.campaignAll.campaigns.push($scope.campaign);
      $scope.campaign = new Campaign();
    };

    $scope.deleteCampaign = function(campaign) {
      Campaign.delete(campaign);
      _.remove($scope.campaignAll.campaigns, campaign)
    }

    $scope.edit = function(campaign) {
      $scope.campaign = campaign;
    };



    $scope.remove = function(campaign) {
      Campaign.delete(campaign);
      _.remove($scope.campaignAll.campaigns, campaign);
    };

    $scope.menuFlights = [
      {"id": 0, "title": "Audience Targeting"},
      {"id": 1, "title": "Catalogue"},
      {"id": 2, "title": "Retargeting"},
      {"id": 2, "title": "Social"},
      {"id": 2, "title": "Awareness - Get On the Long List"},
      {"id": 2, "title": "Research - Stay on the ‘Short List’"},
      {"id": 2, "title": "Retail Drivers - Keep shopper on track"}
    ];

    $scope.currentHeader = null;

    function setCurrentHeader(header) {
      console.log("Current Header => " + header)
      $scope.currentHeader = header;
    }

    $scope.setCurrentHeader = setCurrentHeader;
  }]);