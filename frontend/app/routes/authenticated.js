/* global transition */
import Ember from 'ember';

export default Ember.Route.extend({
  // TODO: Add transition to args
  beforeModel: function() {
    // if (Ember.isEmpty(this.controllerFor('sessions').get('currentUser'))) {
    //   this._setAttemptedTransition(transition);
    //   this.transitionTo('sessions');
    // }
  },
  _setAttemptedTransition: function(transition) {
    var sessionsNew = this.controllerFor('sessions');
    sessionsNew.set('attemptedTransition', transition);
  },
  actions: {
    error: function(reason, transition) {
      if (reason.status === 401) {
        this._setAttemptedTransition(transition);
        this.transitionTo('sessions');
      }
    }
  }
});