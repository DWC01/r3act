/* global Materialize */
import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['panel-add-creatives-wrap'],

  displayAddCreativePanel: false,

  // --- Inititialize ------
  didInsertElement: function() {
    this.$().hide().fadeIn(400);
    Materialize.showStaggeredList('.staggered-creatives');
    this._clearProperties();
  },

  // --- Destructor ------
  willDestroyElement: function() {
    this._clearProperties();
    var clone = this.$().clone();
    this.$().parent().append(clone);
    clone.fadeOut(100);
  }, 

  _clearProperties: function() {
    this.set('creativeType', undefined);
    this.set('parentCreative', undefined);
    this.set('displayAddCreativePanel', undefined);
  },

  _toggleCreativeTypeSwitch: function() {
    if (this.get('creativeType')==='backup-creative') {
      this.set('displayFileTypeSwitch', false);
      this.set('panelHeadingCreativeType', 'Backup');
    } else { 
      this.set('displayFileTypeSwitch', true);
      this.set('panelHeadingCreativeType', '');
    }
  },

  _displayAddCreativePanels: function() {
    this.set('displayAddCreativePanel', true);
      this.set('isSwfCreative', true);
  },

  actions: {
    displayAddCreativePanel: function(creativeType, creative) {
      this.set('creativeType', creativeType);
      if (creative) {this.set('parentCreative', creative);}
      this._toggleCreativeTypeSwitch();
      this._displayAddCreativePanels();
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