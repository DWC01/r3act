/* global Cookies */
import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    var auth_token = Cookies.get('user_session');
    
    if (auth_token) { 
      this.controllerFor('sessions').setCurrentSession(auth_token); 
    } else {
      this.controllerFor('sessions').clearCurrentSession(auth_token);
    }
  }
});