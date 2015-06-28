/* global Materialize */
import Ember from 'ember';

export default Ember.Component.extend({

  classNames: ['panel-add-creative-main-file'],

  // --- Inititialize ------
  didInsertElement: function() {
    this.$().hide().fadeIn(500);
    this.set('creative', 
      this.get('parentController').store.createRecord('creative'));
    this.get('creative').set('creative_type', 'main-ad-tag');
  },

  // --- Destroy ------
  willDestroyElement: function() {
    var creative = this.get('creative');

    if(creative && creative.get('id') === null) {
      this.get('parentController').store.unloadRecord(creative);
    }  
  },

  setMetaDataProperties: function() {
    var meta_data = {};
    meta_data.extension = 'txt';
    meta_data.parent_model = 'flight';
    meta_data.file_name = this.get('creative').get('name');
    meta_data.parent_model_id = this.get('flight').get('id');
    meta_data.ad_tag_code = this.get('creative').get('ad_tag_code');
    return meta_data;
  },

  setCreativeProperties: function() {
    var meta_data = this.setMetaDataProperties();
    this.get('creative').setProperties({
      meta_data: JSON.stringify(meta_data),
      flight: this.get('flight')
    });
  },

  actions: {
    saveCreative: function() {
      this.setCreativeProperties();

      this.get('creative').save().then(
        function() {
          Materialize.toast('Tag Creative Saved', 4000);
          this.sendAction('rerenderPanelAddCreative'); 
        }.bind(this),
        function(reason) { 
          this.set('creative_errors', reason.errors);
        }.bind(this)
      );
    }
  }
});