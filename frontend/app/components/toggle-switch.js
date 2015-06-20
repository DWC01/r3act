import Ember from 'ember';

export default Ember.Component.extend({

	didInsertElement: function() {
		Ember.$('input[type=checkbox]').click(function(e) {
        e.stopPropagation();
    });
	},

	click: function() {		
		this.sendAction('toggleCreativeType');
	}
	
});
