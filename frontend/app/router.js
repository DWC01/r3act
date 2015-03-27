import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  
  // Users
  this.resource('users', function() {
    this.route('new');
    this.route('show');
  });
  // Sessions
  this.resource('sessions', function() {
    this.route('new');
  });
  // Password Resets
  this.resource('password_resets', function() {
    this.route('new');
    this.route('edit');
  });
  // Campaigns
  this.resource('campaigns', function() {
    this.resource('campaign', { path: '/:campaign_id' });
  });




});

export default Router;
