import NonCampaignPageRoute from  '../non-campaign-page';

export default NonCampaignPageRoute.extend({
  model: function(params) {
    return this.store.find('company', params.company_id);
  }
});
