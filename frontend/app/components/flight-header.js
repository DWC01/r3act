import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['flight-header'],

  displayAddCreativesPanel: false,

  actions: {
  	toggleDisplayAddCreatives: function() {
  		if(this.get('displayAddCreativesPanel')) {
  			this.set('displayAddCreativesPanel', false);
  		} else {
  			this.set('displayAddCreativesPanel', true);
  		}
  	}
  }
});