import Ember from 'ember';

export default Ember.Component.extend({
	actions: {
		addCreative: function() {
			console.log('adding Creative!!');
		},
		createCreative: function() {
			console.log('Creating Creative!!');
			console.log(this.get('creative'));
		}
	}
});
