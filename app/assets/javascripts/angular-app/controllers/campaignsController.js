angular
  .module('r3act')

  .controller('CampaignsController', 
    function($rootScope, $scope, $route, $routeParams, Restangular) {
    
    // Set Base (Route Object)
    var baseCampaigns = Restangular.all('campaigns');
    
    // Query list for promise
    baseCampaigns.getList().then(function(campaigns) {
      $scope.campaigns = campaigns;
    });

    // Query one campaign


    //If you want to use URL attributes before the website is loaded
    $rootScope.$on('$routeChangeSuccess', function () {

      Restangular.one('campaigns', $routeParams.id).get().then(function(campaign){
        $scope.campaign = campaign
      })
        
      $scope.adtags = Restangular.one('campaigns', $routeParams.id).getList('ad_tags').$object;      
    });

    
    var saveCampaign = function(data) {
      console.log("is this running?");
      $scope.campaign.name = data.name;
      $scope.campaign.save();
    }

    $scope.saveCampaign = saveCampaign;

    // *** WORKS *** // 
    // POST /Campaigns
    // var newCampaign = {name: "DC's Campaign"};
    // baseCampaigns.post(newCampaign);


  });