import Ember from 'ember';

export default Ember.ArrayController.extend({

  clearAll: function() {
    this.set('creative', undefined); 
  },

  isAdTag: function() {
    var isAdTag = this.get('creative').get('extension') === 'txt';
    
    if (isAdTag) {
      this.setAdTag();
  	  return isAdTag;
    }
  }.property()
  
});