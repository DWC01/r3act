import AuthenticatedRoute from  '../authenticated.js';

export default AuthenticatedRoute.extend({
  model: function(params) {
    // this.controllerFor('application')
    //   .set('campaign_id', params.campaign_id); 
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