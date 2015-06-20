import Ember from 'ember';

export default Ember.Component.extend({
	
	// --- Inititialize ------
  didInsertElement: function() {
    this.$().hide().fadeIn(500);
  }

});
