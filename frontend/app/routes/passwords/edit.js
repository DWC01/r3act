import NonCampaignPageRoute from  '../non-campaign-page';

export default NonCampaignPageRoute.extend({
  model: function(params) {
    return params.password_reset_token;
  },
  setupController: function (controller, model) {
    controller.set('password_reset_token', model);
  }
});
