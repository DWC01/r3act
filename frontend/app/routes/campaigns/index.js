import AuthenticatedRoute from  '../authenticated.js';

export default AuthenticatedRoute.extend({
  model: function() {
    // var access_token = this.controllerFor('sessions.new').get('access_token');
    // var access_token = Ember.controllerFor('sessions.new').get('access_token');
    // console.log(access_token);
    return this.store.find('campaign');
  },
  setupController: function (controller, model) {
    controller.set('campaigns', model);
  }
});
