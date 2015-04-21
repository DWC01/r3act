/* global Cookies */
import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    this.controllerFor('sessions').clearAll();
    this._removeSessionCookie();
    this._clearAllModelStore();
    
    this.transitionTo('home');
  },
  _removeSessionCookie: function() {
    Cookies.remove('user_session', { path: '/' });
  },
  _clearAllModelStore: function() {
    this.store.unloadAll('user');
    this.store.unloadAll('api_key');
    this.store.unloadAll('campaign');
    this.store.unloadAll('ad_tag');
    this.store.unloadAll('flight');
    this.store.unloadAll('flash');
    this.store.unloadAll('company');
  }
});