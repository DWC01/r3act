import Ember from 'ember';

export default Ember.Controller.extend({  
  
  needs: ['flash', 'sessions', 'campaigns', 'tags'],

  isLoggedIn: function(){
    return this.get('controllers.sessions.isLoggedIn');
  }.property('controllers.sessions.isLoggedIn'),

  currentUser: function() {
    return this.get('controllers.sessions.currentUser');
  }.property('controllers.sessions.currentUser'),

  currentAvatar: function() {
    return this.get('controllers.sessions.currentAvatar');
  }.property('controllers.sessions.currentAvatar'),

  currentCampaign: function() {
    return this.get('controllers.campaigns.currentCampaign');
  }.property('controllers.campaigns.currentCampaign'),

  flash: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: type, message: message
    });
  }

});