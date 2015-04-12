import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('campaign', params.campaign_id);
  },
  setupController: function (controller, model) {
    var flights = this.buildFlights(controller, model);    
    controller.set('flights', flights);
  },
  flights: function(model) {
    return this.store.all('flight').filter(function(flight) {
      return (String(flight.get('campaign_id'))) === model.id;
    });
  },
  buildFlights: function(controller, model) {
    var self = this;
    var flights = this.flights(model);

    flights = flights.map(function(flight) {
      flight.set('tags', self.ad_tags(flight));
      return flight;
    });
    return flights;
  },
  ad_tags: function(flight) {
    return this.store.all('ad_tag').filter(function(ad_tag) {
      return (String(ad_tag.get('flight_id'))) === flight.get('id');
    });
  }
});
