import AuthenticatedRoute from  '../authenticated';

export default AuthenticatedRoute.extend({
	beforeModel: function() {
		this.controllerFor('campaigns').set('currentCampaign', undefined);
	},
  model: function() {
    return this.store.find('campaign');
  },
  setupController: function (controller, model) {
    controller.set('campaigns', model);
  }
});
