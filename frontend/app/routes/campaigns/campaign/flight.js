import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    console.log("Loaded Route campaigns.campaign.flight");
    return this.store.find('flight', params.flight_id);
  },
  setupController: function (controller, model) {
    controller.set("model", model);
    model.reload();
  }
});