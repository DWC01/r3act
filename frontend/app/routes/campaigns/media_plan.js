import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('campaign', params.campaign_id);
  },

  setupController: function (controller, model) {
    controller.clearAll();
    this._setFlights(controller, model);
    controller.set('campaign', model);
  },

  _setFlights: function(controller, model) {
    this.store.find('flight', {campaign_id: model.id})
      .then(function(flights) {
        controller.set('flights', flights);
      }.bind(this));
  }

});