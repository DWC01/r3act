import Ember from 'ember';

export default Ember.Route.extend({
  
  model: function() {
    return this.store.createRecord('campaign');
  },

  setupController: function(controller,model) {
    controller.clearAll();
    controller.set('campaign', model);
  }
  
});