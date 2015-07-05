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
  }.property(),

  setAdTag: function() {
    Ember.$.get(this.get('creative').get('resource_url')).then(
      function(response){
        Ember.$('.tag-display-wrap').append(
          JSON.parse(response).ad_tag_code);
      }.bind(this),
      function(response) { 
        console.log(response);
      }.bind(this)
    );
  }
  
});