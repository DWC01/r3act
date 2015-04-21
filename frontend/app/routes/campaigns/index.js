import AuthenticatedRoute from  '../authenticated.js';

export default AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('campaign');
  },
  setupController: function (controller, model) {
    controller.set('campaigns', model);
  }
});
