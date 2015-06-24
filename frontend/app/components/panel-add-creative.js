import Ember from 'ember';

export default Ember.Component.extend({
  
  isSwfCreative: true,

  isAdTagCreative: false,

  setIsSfwCreative: function() {
    return this.get('isSwfCreative');
  }.property('isSwfCreative'), 
  
  setIsAdTagCreative: function() {
    return this.get('isAdTagCreative');
  }.property('isAdTagCreative'),

  actions: {
    toggleCreativeType: function() {
      this.toggleProperty('isSwfCreative');
      this.toggleProperty('isAdTagCreative');
    },
    rerenderPanelAddCreative: function() {
      this.sendAction('rerenderPanelAddCreative');
    }
	}
});
