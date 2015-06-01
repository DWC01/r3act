import NonCampaignPageRoute from  '../non-campaign-page';

export default NonCampaignPageRoute.extend({
  model: function() {
    return this.store.find('company');
  }
});