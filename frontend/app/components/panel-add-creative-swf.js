/* global Materialize */
import Ember from 'ember';

export default Ember.Component.extend({

	classNames: ['panel-add-creative-swf'],

	// --- Inititialize ------
  didInsertElement: function() {
    this.$().hide().fadeIn(500);
    this.set('swfCreative', 
      this.get('parentController').store.createRecord('swfCreative'));
  },

  // --- Destroy ------
  willDestroyElement: function() {
    var swfCreative = this.get('swfCreative');

    if(swfCreative && swfCreative.get('id') === null) {
      this.get('parentController').store.unloadRecord(swfCreative);
    }  
  },

  saveSwfCreative: function() {
    this.get('swfCreative').save().then(
      function() {
        Materialize.toast('Swf Creative Saved', 4000);
        this.sendAction('rerenderPanelAddCreative'); 
      }.bind(this),
      function(reason) { 
        this.set('creative_errors', reason.errors);
      }.bind(this)
    );
  }.observes('meta_data'),

  setMetaData: function(meta_data) {
    meta_data.parent_model = 'flight';
    meta_data.parent_model_id = this.get('flight').get('id');
    this.set('meta_data', JSON.stringify(meta_data));
  },

  actions: {
  	setFileName: function(fileName) {
  		this.set('fileName', fileName);
  	},
  	setS3data: function(s3data) {
      this.setMetaData(s3data);
  	 	this.get('swfCreative').set('meta_data', this.get('meta_data'));
    }
  }

});
