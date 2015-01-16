angular
  .module('r3act')

  .controller('CampaignController', 
    function($rootScope, $scope, $route, $routeParams, 
             $stateParams, Restangular, $http) {

    $routeParams.id = $stateParams.id
    
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


    $scope.dash = {
      view: 'Pacing'
    };

    // // Simple GET request example :
    $http.get('http://www.displayadtech.com/api/companies?name=DoubleClick for Publishers').
      success(function(data, status, headers, config) {
        $scope.company = data[0];
        $scope.company.listLogoUrl = data[0].logo.company_list_logo.url
      }).
      error(function(data, status, headers, config) {
        // called asynchronously if an error occurs
        // or server returns response with an error status.
      });

  });