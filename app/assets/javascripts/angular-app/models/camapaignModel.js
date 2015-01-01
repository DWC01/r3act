angular
  .module('r3act')

  .factory('Campaign', function($resource) {
    var Campaign = $resource('http://localhost:3000/api/campaigns/:id',
    { id:'@id' }, {
      'query': {
        method: 'GET'
      },
      update: {
        method: 'PUT'
      }
    });
    return Campaign;
  })

  .factory('CampaignAdTag', function($resource) {
    var CampaignAdTag = $resource('http://localhost:3000/api/campaigns/43/ad_tags',
    { id:'@id' }, {
      'query': {
        method: 'GET'
      }
    });
    return CampaignAdTag;
  })
