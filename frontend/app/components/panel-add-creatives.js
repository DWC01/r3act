/* global Materialize */
import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['panel-add-creatives-wrap'],

  displayAddCreativePanel: false,

  // --- Inititialize ------
  didInsertElement: function() {
    this.$().hide().fadeIn(400);
    Materialize.showStaggeredList('.staggered-creatives');
  },

  // --- Destructor ------
  willDestroyElement: function() {
    var creative = this.get('creative');
    if(creative && creative.get('id') === null) {
      this.get('parentController').store.unloadRecord(creative);
    }

    var clone = this.$().clone();
    this.$().parent().append(clone);
    clone.fadeOut(100);
  }, 

  actions: {
    displayAddCreativePanel: function(creativeType, creative) {
      if (creative) {this.set('creative', creative);}
      this.set('creativeType', creativeType);
    	this.set('displayAddCreativePanel', true);
      
      if (creativeType==='backup-creative') {
        this.set('displayFileTypeSwitch', false);
        this.set('panelHeadingCreativeType', 'Backup');
      } else {
        this.set('displayFileTypeSwitch', true);
        this.set('panelHeadingCreativeType', '');
      }
    },
    closeAddCreativePanel: function() { 
      Ember.run.later(this, (function() {
        this.set('displayAddCreativePanel', false);
      }), 500);
    },
    rerenderPanelAddCreative: function() {
      this.rerender();
    },
    deleteCreative: function(creative){
      creative.destroyRecord();
    }
  }
}); 