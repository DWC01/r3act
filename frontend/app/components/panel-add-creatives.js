/* global Materialize */
import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['panel-add-creatives-wrap'],

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
    displayAddCreativePanel: function() {
    	this.set('displayAddCreativePanel', true);
    },
    closeAddCreativePanel: function() { 
      Ember.run.later(this, (function() {
        this.set('displayAddCreativePanel', false);
      }), 500);
    },
    rerenderPanelAddCreative: function() {
      this.rerender();
    }
   //  deleteCreative: function(creative){
   //    creative.destroyRecord();
   //  }
  }
}); 