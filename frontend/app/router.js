import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  // Campaigns
  this.resource('campaigns', function() {});

  this.resource('campaign', {path: 'campaigns/:campaign_id'}, function() {});

});

export default Router;
