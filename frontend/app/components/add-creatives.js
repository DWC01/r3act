import Ember from 'ember';

export default Ember.Component.extend({
	classNames: ['add-creatives'],

	displayCreativeForm: false,

	actions: {
		toggleCreativeForm: function() {
			if(this.get('displayCreativeForm')){
				this.set('displayCreativeForm', false);
			} else {
				this.set('displayCreativeForm', true);
			}
		},
		addCreative: function() {
			var creative = this.get('parentController').store.createRecord('creative');
			creative.set('name', 'The name');
			this.get('creativeList').push(creative);
		}
	}
});
