import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['panel-collapse', 'collapse', 'in'],
  
  ariaRole: 'tabpanel',

  attributeBindings: ['labelledby:aria-labelledby'],

  labelledby: function() {
    return this.get('panelFor');
  }.property('panelFor'),

  isMenu: function() {
    if( this.get('panelFor')==='menu' ) {
      return true;
    }
  }.property('panelFor'),

  isSettings: function() {
    if( this.get('panelFor')==='settings' ) {
      return true;
    }
  }.property('panelFor')


});
