import Ember from 'ember';

export default Ember.ArrayController.extend({

  clearAll: function() {
    this.set('creative', undefined); 
  },

  isSwf: function() {
  	return ( this.get('creative').get('extension') === 'swf');
  }.property(),

  isImage: function() {
  	var extension = this.get('creative').get('extension');
  	return extension === 'jpg' || extension === 'png' || extension === 'gif';
  }.property(),

  isAdTag: function() {      
  	return this.get('creative').get('extension') === 'txt';
  }.property(),

  showVerticalLayout: function() {
  	return (Number(this.get('creative').get('width')) < 400);
  }.property(),
  
  swfDuration: function() {
  	return (Number(this.get('creative').get('duration')) / 1000);
  }.property(),

  tagDisplayUrl: function() {
    return "/tags/" + this.get('creative').get('id');
  }.property()
  
});