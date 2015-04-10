import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return this.store.find('campaign');
  },
  setupController: function (controller, model) {
    controller.set('campaigns', model);
  }
});
