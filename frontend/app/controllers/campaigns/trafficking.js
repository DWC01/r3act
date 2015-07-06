import Ember from 'ember';

export default Ember.ArrayController.extend({

  clearAll: function() {
    this.set('flights', undefined); 
  },

	init: function() {
		this._getDcm();
    this.set('flightList', {});
	},

  traffickingHeader: function() {
    return "Trafficking -> " + this.get('campaign').get('name');
  }.property(),

	_getDcm: function() {
		Ember.$.get('http://www.displayadtech.com/api/companies?name=DoubleClick for Publishers').then(
      function(response) {
      	var dcm = response[0];
        this.set('dcm', dcm);
      }.bind(this),
      function(response) {
        console.log('Error requesting company data.');
        console.log(response);
      }.bind(this)
    );
	},

  _flightIdsToTraffic: function() {
    var flightIds = [];
    Ember.$('.traffic-flight-checkbox').each(function() {
      if(Ember.$(this).is(':checked')) {
        flightIds.push(Ember.$(this).attr('id'));
      }
    });
    return flightIds;
  },

  _setTraffickingData: function() {
    return {
      campaign: this.get('campaign').get('data'),
      flight_ids: this._flightIdsToTraffic()
    };
  },

  traffickingStatus: 'pending',

  trafficPending: function() {
    return this.get('traffickingStatus') === 'pending';
  }.property('traffickingStatus'),

  trafficInProgress: function() {
    return this.get('traffickingStatus') === 'inProgress';
  }.property('traffickingStatus'),

  trafficComplete: function() {
    return this.get('traffickingStatus') === 'complete';
  }.property('traffickingStatus'),

  actions: {
    trafficCampaign: function() {
      this.set('traffickingStatus', 'inProgress');
      var data = this._setTraffickingData();

      Ember.$.post('/api/traffic_campaign', data).then(
        function(response) {
          console.log(response);
          this.set('traffickingStatus', 'complete');
        }.bind(this),
        function(response) {
          console.log('Error Trafficking Campaign');
          console.log(response);
        }.bind(this)
      );
    }

  }

}); 