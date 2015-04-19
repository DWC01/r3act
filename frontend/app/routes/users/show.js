import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('user', params.user_id);
  },
  setupController: function (controller, model) {
    controller.set('api_key', this.api_key(model));
    controller.set('model', model);
  },
  api_key: function(model) {
    return this.store.find('api_key', model.id);
  }
});
