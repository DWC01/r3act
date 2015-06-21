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

  actions: {
    createCreative: function() {
      this.createCreative();
    },
    createCreativeInstance: function(creative_type) {
    	this.set('displayAddCreativeComponent', true);
      this.set('creative', 
        this.get('parentController').store.createRecord('creative'));
      this.get('creative').set('creative_type', creative_type);
    },
    removeCreativeInstance: function() {
      var creative = this.get('creative');
    	
    	Ember.run.later((function() {
	    	this.set('displayAddCreativeComponent', false);
			}.bind(this)), 500);
			
      if(creative.get('id') === null) {
	      this.get('parentController').store.unloadRecord(creative);
	    }
    },
  	setCreativeMetaData: function(meta_data) {
      meta_data.parent_model = 'flight';
  		meta_data.creative_type = this.get('creative_type');
  	  this.get('creative').set('meta_data', JSON.stringify(meta_data));
      this.createCreative(); 
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