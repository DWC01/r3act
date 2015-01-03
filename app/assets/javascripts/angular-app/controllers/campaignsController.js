angular
  .module('r3act')

  .controller('CampaignsController', function($scope, Restangular) {
    // Set Base (Route Object)
    var baseCampaigns = Restangular.all('campaigns');

    // Query list for promise
    baseCampaigns.getList().then(function(campaigns) {
      $scope.campaigns = campaigns;
    });

    $scope.campaign = Restangular.one('campaigns',  59).get().$object;
      
       
    // *** WORKS *** // 
    // POST /Campaigns
    // var newCampaign = {name: "DC's Campaign"};
    // baseCampaigns.post(newCampaign);


  });