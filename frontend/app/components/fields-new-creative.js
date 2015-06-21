import Ember from 'ember';

export default Ember.Component.extend({

	classNames: ['fields-new-creative'],

	// --- Inititialize ------
  didInsertElement: function() {
    this.$().hide().fadeIn(500);
  },

  // --- Destroy ------
  willDestroyElement: function() {
    this.set('fileName', undefined);
    this.sendAction('clearCreativeProperties');
    this.sendAction('clearCreativeErrors');
  },

  actions: {
  	setFileName: function(fileName) {
  		this.set('fileName', fileName);
  	},
  	setS3data: function(s3data) {
  	 	this.sendAction('setS3data', s3data);
    }
  }

});
