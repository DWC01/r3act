import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    console.log("Loaded Route Campaign");
    return this.store.find('campaign', params.campaign_id);
  },
  setupController: function (controller, model) {
    controller.set("model", model);
    model.reload();
  }
});