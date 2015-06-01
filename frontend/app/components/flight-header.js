import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['flight-header'],

  displayAddCreatives: false,

  actions: {
  	toggleDisplayAddCreatives: function() {
  		if(this.get('displayAddCreatives')) {
  			this.set('displayAddCreatives', false);
  		} else {
  			this.set('displayAddCreatives', true);
  		}
  	}
  }
});