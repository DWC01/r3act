import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  
  this.resource('campaigns', function() {
    this.route('new',  {path: 'new'});
    this.route('show', {path: ':campaign_id'});
  });

  this.resource('users', function(){
    this.route('new');
    this.route('show', {path: ':user_id'});
  });

  this.route('sessions.new', {path:'sign-in'});

});

export default Router;
