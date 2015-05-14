import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'section',
  classNames: ['sticky-left', 'sidebar', 'show-sidebar'],

  main: function() {
    return this.get('currentResource') === 'main';
  }.property('currentResource'),
  
  campaign: function() {
    return this.get('currentResource') === 'campaign';
  }.property('currentResource'),

  campaigns: function() {
    return this.get('currentResource') === 'campaigns';
  }.property('currentResource'),

  newCampaign: function() {
    return this.get('currentResource') === 'newCampaign';
  }.property('currentResource'),

});
