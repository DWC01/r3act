import Ember from 'ember';

export default Ember.ArrayController.extend({
  clearAll: function() {
    this.set('flights', undefined); 
  }
});