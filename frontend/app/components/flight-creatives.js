import Ember from 'ember';

export default Ember.Component.extend({
	classNames: ['flight-creatives-wrap'],

	actions: {
		deleteCreative: function(creative){
			creative.destroyRecord();
		}
	}
});
