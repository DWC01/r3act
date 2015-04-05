import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  
  this.resource('campaigns', function() {
    this.route('show', {path: ':campaign_id'}, function() {});
    this.route('new', {path: 'new'});
  });

});

export default Router;
