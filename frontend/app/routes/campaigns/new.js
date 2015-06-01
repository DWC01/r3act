// import Ember from 'ember';
import AuthenticatedRoute from  '../authenticated';

export default AuthenticatedRoute.extend({
	beforeModel: function() {
		this.controllerFor('campaigns').set('currentCampaign', undefined);
	},
  model: function() {
  	return this.store.createRecord('campaign');
  },
  setupController: function(controller,model) {
    controller.clearAll();
    controller.set('campaign', model); 
  } 
});