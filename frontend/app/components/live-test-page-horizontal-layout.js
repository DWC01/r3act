import Ember from 'ember';

export default Ember.Component.extend({

	didInsertElement: function() {
		if(this.get('isAdTag')) {
			Ember.$('.test-page-creative-wrap').first().append(
				this.get('creative').get('resource_url'));
		}
	}
});
