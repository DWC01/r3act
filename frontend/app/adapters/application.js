/* global Cookies */
import Ember from 'ember';
import DS from 'ember-data';

export default DS.ActiveModelAdapter.extend({
  namespace: 'api',
  host: 'http://localhost:3000',
  headers: Ember.computed(function(){
    var auth_token = Cookies.get('user_session');
    if (auth_token) {
      return {'Authorization': 'Token token=' + '"' + auth_token + '"'};
    } 
  }).property().volatile()
});