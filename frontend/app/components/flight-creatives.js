/* global Materialize */
import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['flight-creatives-wrap'],

  displayAddCreativeComponent: false,

  // --- Inititialize ------
  didInsertElement: function() {
  	this.$().hide().fadeIn(400);
  	Materialize.showStaggeredList('.staggered-creatives');
  },

  // --- Destructor ------
  willDestroyElement: function() {
  	var clone = this.$().clone();
    this.$().parent().append(clone);
    clone.fadeOut(100); 
  },

  actions: {
    createCreativeInstance: function() {
    	this.set('displayAddCreativeComponent', true);
      this.set('creative', 
        this.get('parentController').store.createRecord('creative'));
    },
    removeCreativeInstance: function() {
      var creative = this.get('creative');
    	
    	Ember.run.later((function() {
	    	this.set('displayAddCreativeComponent', false);
			}.bind(this)), 500);
			
      if( creative.get('id') === null ) {
	      this.get('parentController').store.unloadRecord(creative);
	    }
    },
  	setCreativeMetaData: function(meta_data) {
  		meta_data.flight_id = this.get('flight').get('id');
  	  this.get('creative').set('meta_data', JSON.stringify(meta_data));
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
    deleteCreative: function(creative){
      creative.destroyRecord();
    }
  }
}); 