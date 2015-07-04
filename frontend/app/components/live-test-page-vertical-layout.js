import Ember from 'ember';

export default Ember.Component.extend({
	didInsertElement: function() {
		console.log(this.get('creative').get('resource_url'));
		if(this.get('isAdTag')) {
			Ember.$('.test-page-creative-wrap').append(
				this.get('creative').get('resource_url'));
		}
	}
});
