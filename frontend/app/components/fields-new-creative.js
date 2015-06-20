import Ember from 'ember';

export default Ember.Component.extend({

	classNames: ['fields-new-creative'],

	// --- Inititialize ------
  didInsertElement: function() {
  	this.clearAll();
    this.$().hide().fadeIn(300);
  },

  // --- Clear ------
  clearAll: function() {
    this.setProperties({
      s3_data: undefined,
      fileName: undefined
    });
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
