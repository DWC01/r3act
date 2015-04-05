import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('campaign', params.campaign_id);
  },
  setupController: function (controller, model) {
    controller.set('campaign', model);
    controller.set('flights', this.flights(model));
  },
  flights: function(model) {
    return this.store.find('flight', {campaign_id: model.id });
    // return this.store.all('flight').filter(function(flight) {
    //   if (String(flight.get('campaign_id')) === model.id ) { return flight; }
    // });
  }
});
