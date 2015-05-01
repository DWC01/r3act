import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('user', params.user_id);
  },
  setupController: function (controller, model) {
    controller.clearAll();
    controller.set('model', model);
  }
});
