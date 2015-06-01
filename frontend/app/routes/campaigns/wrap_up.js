import AuthenticatedRoute from  '../authenticated';

export default AuthenticatedRoute.extend({
  model: function(params) {
    return this.store.find('campaign', params.campaign_id);
  },
  setupController: function (controller, model) {
    controller.set('campaign', model);
    this.controllerFor('campaigns').set('currentCampaign', model);
  }
});