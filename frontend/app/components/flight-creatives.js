/* global Materialize */
import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['flight-creatives-wrap'],

  displayAddCreativeComponent: false,

  // --- Inititialize ------
  didInsertElement: function() {
    this.clearAll();
    this.$().hide().fadeIn(400);
    Materialize.showStaggeredList('.staggered-creatives');
  },

  // --- Destructor ------
  willDestroyElement: function() {
    var clone = this.$().clone();
    this.$().parent().append(clone);
    clone.fadeOut(100);
  }, 

  // --- Clear ------
  clearAll: function() {
    this.setProperties({
      creative: undefined, 
      meta_data: undefined,
      creative_type: undefined,
      creative_errors: undefined, 
      displayAddCreativeComponent: undefined
    });
  },

  createCreative: function() {
    this.get('creative').save().then(
      function() {
        Materialize.toast('Creative Saved', 4000);
        this.rerender(); 
      }.bind(this),
      function(reason) { 
        this.set('creative_errors', reason.errors);
      }.bind(this)
    );
  },

  setCreativeMetaData: function (data) {
    var meta_data = data || {};
    meta_data.parent_model = 'flight';
    meta_data.parent_model_id = this.get('flight').get('id');
    meta_data.creative_type = this.get('creative_type');

    this.get('creative').set('meta_data', JSON.stringify(meta_data));
    this.createCreative();
  },

  actions: {
    createCreative: function() {
      if (this.get('creative').get('creative_type')) {
        this.setCreativeMetaData();
      }
      this.createCreative();
    },
    createCreativeInstance: function(creative_type) {
    	this.set('displayAddCreativeComponent', true);

      Ember.run.later(this, (function() {
        this.set('creative', 
          this.get('parentController').store.createRecord('creative'));
        this.get('creative').set('creative_type', creative_type);
        this.get('creative').set('flight', this.get('flight'));   
      }), 1000);

    },
    removeCreativeInstance: function() {
      var creative = this.get('creative');
    	
    	Ember.run.later(this, (function() {
	    	this.set('displayAddCreativeComponent', false);
			}), 500);
			
      if(creative.get('id') === null) {
	      this.get('parentController').store.unloadRecord(creative);
	    }
    },
  	setCreativeMetaData: function(meta_data) {
      this.setCreativeMetaData(meta_data); 
  	},
    clearCreativeErrors: function() {
      this.set('creative_errors', undefined);
    },
    clearCreativeProperties: function() {
      if (this.get('creative') && this.get('creative').get('id') === null) {
        this.get('creative').setProperties({
          width: undefined,
          height: undefined,
          ad_tag_code: undefined,
          meta_data: undefined,
          name: undefined
        });
      }
    },
    deleteCreative: function(creative){
      creative.destroyRecord();
    }
  }
}); 