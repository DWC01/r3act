import Ember from 'ember';

export default Ember.Controller.extend({
    needs: ['sessions/new', 'flash'],

    currentUser: (function() {
      return this.get('controllers.sessions.currentUser');
    }).property('controllers.sessions.currentUser'),

    flash: function(type, message) {
      this.get('controllers.flash').createFlash({
        type: type, message: message
      });
    }
});
