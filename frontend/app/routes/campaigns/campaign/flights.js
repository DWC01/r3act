import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    var campaignModel = this.modelFor('campaigns.campaign');
    return this.store.find('flight', {campaign_id:campaignModel.get('id')});
  }
});