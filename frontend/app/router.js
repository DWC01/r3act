import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  
  this.resource('campaigns', function() {
    this.resource('campaigns.campaign',                            { path: ':campaign_id'}, function() {
      this.resource('campaigns.campaign.flights',                  { path: 'flights'     }, function() {
        this.resource('campaigns.campaign.flights.flight',         { path: ':flight_id'  }, function() {
          this.resource('campaigns.campaign.flights.flight.ad_tags',{ path: 'ad_tags'     }, function() {
            this.route('campaigns.campaign.flights.flight.ad_tags.adtag',  { path: ':ad_tag_id'});
          });
        });
      });
    });
    this.route('new');
  });

});

export default Router;
