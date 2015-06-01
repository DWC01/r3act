import NonCampaignPageRoute from  '../non-campaign-page';

export default NonCampaignPageRoute.extend({
  model: function() {
    return this.store.find('user');
  },
  setupController: function (controller, model) {
    controller.set('users', model);
  }
});