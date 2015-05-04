/* global Cookies */
import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    this.controllerFor('sessions').clearCurrentSession();
    this._clearAllModelStore();
    this.transitionTo('home');
  },
  _clearAllModelStore: function() {
    this.store.unloadAll('user');
    this.store.unloadAll('campaign');
    this.store.unloadAll('ad_tag');
    this.store.unloadAll('flight');
    this.store.unloadAll('flash');
    this.store.unloadAll('avatar');
    this.store.unloadAll('company');
  }
});