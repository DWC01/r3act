import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
	this.route('home', {path: '/'});

	this.resource('campaigns', function() {
	  this.route('new',  {path: 'new'});
	  this.route('media_plan',  {path: ':campaign_id/media_plan' });
	  this.route('analytics',   {path: ':campaign_id/analytics'  });
	  this.route('trafficking', {path: ':campaign_id/trafficking'});
	  this.route('wrap_up', {path: ':campaign_id/wrap_up'});
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

	this.route('passwords.new', {path: 'passwords/new'});
	this.route('passwords.edit', {path: 'passwords/reset'});


	this.route('non_campiagn_page');
	this.route('nonCampaignPage');
});

export default Router;
