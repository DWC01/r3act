import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    console.log("Loaded Route Ad Tags");
    var flightModel = this.modelFor('campaigns.campaign.flights.flight');
    return this.store.find('ad_tag', {flight_id:flightModel.get('id')});
  }
});