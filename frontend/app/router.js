import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {

  this.route('home', {path: '/'});
  
  this.resource('campaigns', function() {
    this.route('new',  {path: 'new'});
    this.route('show', {path: ':campaign_id'});
  });

  this.resource('companies', function() {
    this.route('new',  {path: 'new'});
    this.route('show', {path: ':company_id'});
  });

  this.resource('users', function() {
    this.route('show', {path: ':user_id'});
  });
  this.route('users.new', {path: 'sign-up'});

  this.route('sessions', {path: 'sign-in'});
  this.route('sessions.destroy', {path: 'sign-out'});

});

export default Router;
