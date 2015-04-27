import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('campaign', params.campaign_id);
  },

  setupController: function (controller, model) {
    var flights = this._getFlights(controller, model);
    controller.set('campaign', model);
    controller.set('flights', flights);
  },

  _getFlights: function(controller, model) {
    var flights = this._flights(model);
    
    flights.then(function(flights) {
      flights = this._add_ad_tags(flights);
    }.bind(this));

    return flights;
  },

  _flights: function(model) {
    return this.store.find('flight', {campaign_id: model.id});
  },

  _add_ad_tags: function(flights) {
    return flights.map(function(flight) {
      return flight.set('tags', this._ad_tags(flight));
    }.bind(this));    
  },

  _ad_tags: function(flight) {
    return this.store.all('ad_tag').filter(function(ad_tag) {
      return (String(ad_tag.get('flight_id'))) === flight.get('id');
    });
  }

});