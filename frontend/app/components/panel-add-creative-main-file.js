/* global Materialize */
import Ember from 'ember';

export default Ember.Component.extend({

	classNames: ['panel-add-creative-main-file'],

	// --- Inititialize ------
  didInsertElement: function() {
    this.$().hide().fadeIn(500);
    if(this.get('creativeType') === 'main-creative') {
      this.set('creative',
        this.get('parentController').store.createRecord('creative'));
      this.get('creative').set('creative_type', this.get('creativeType'));
    }
    if(this.get('creativeType') === 'backup-creative') {
      this.set('creative',
        this.get('parentController').store.createRecord('backup_creative'));
      this.get('creative').set('creative_type', this.get('creativeType'));
      this.get('creative').set('creative', this.get('parentCreative'));
    } 
  },

  // --- Destroy ------
  willDestroyElement: function() {
    var creative = this.get('creative');

    if(creative && creative.get('id') === null) {
      this.get('parentController').store.unloadRecord(creative);
    }  
  },

  saveCreative: function() {
    this.get('creative').save().then(
      function(creative) {
        Materialize.toast(
          this._capitalizeFirstLetter(creative.get('extension')) + ' Creative Saved', 
          4000);
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
  
  _capitalizeFirstLetter: function(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
  },

  actions: {
  	setFileName: function(fileName) {
  		this.set('fileName', fileName);
  	},
  	setS3data: function(s3data) {
      this.setMetaData(s3data);
  	 	this.get('creative').set('meta_data', this.get('meta_data'));
    }
  }

});