import Ember from 'ember';
import DS from 'ember-data';

export default DS.ActiveModelAdapter.extend({
  namespace: 'api',
  host: 'http://localhost:3000',
  headers: Ember.computed(function(){
    var access_token = Cookies.get('user_session');
    if (access_token) {
      return {'Authorization': 'Token token=' + '"' + access_token + '"'};
    } 
  }).property().volatile()
});