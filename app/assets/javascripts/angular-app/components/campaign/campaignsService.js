angular
  .module('r3act')

  .factory('getAllCampaigns', function() {
    // Set Base (Route Object)
    var baseCampaigns = Restangular.all('campaigns');
    // Get All Campaigns
    baseCampaigns.getList().then(function(campaigns) {
      return campaigns;
    });
  });