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

    //If you want to use URL attributes before the website is loaded
    $rootScope.$on('$routeChangeSuccess', function () {
      $scope.campaign = Restangular.one('campaigns', $routeParams.id).get().$object;
      console.log($routeParams.id);

      $scope.adtags = Restangular.one('campaigns', $routeParams.id).getList('ad_tags').$object;

      console.log($scope.adtags);
    });

      
       
    // *** WORKS *** // 
    // POST /Campaigns
    // var newCampaign = {name: "DC's Campaign"};
    // baseCampaigns.post(newCampaign);


  });