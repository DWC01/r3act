import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('campaign', params.campaign_id);
  },
  setupController: function (controller, model) {
    controller.set('campaign', model);
    controller.set('flights', this.flights(model));


    var flights = controller.get('flights');
    var self = this;

    flights = flights.map(function(flight) {
      flight.set('tags', self.ad_tags(flight));
      return flight;
    });
    
    controller.set('flights', flights);
  },
  flights: function(model) {
    // return this.store.find('flight', {campaign_id: model.id });
    return this.store.all('flight').filter(function(flight) {
      return (String(flight.get('campaign_id'))) === model.id
    });
  },
  ad_tags: function(flight) {
    // return this.store.find('ad_tag', {flight_id: flight.id });
    return this.store.all('ad_tag').filter(function(ad_tag) {
      return (String(ad_tag.get('flight_id'))) === flight.get('id')
    });
  }
});
