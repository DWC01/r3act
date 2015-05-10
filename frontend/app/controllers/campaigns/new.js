import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['flash'],

  s3_data: undefined,

  // --- Set Clear -------------

  clearAll: function() {
    this.set('s3_key', undefined); 
  },
    
  // --- Bind Observers -------------

  _setCampaignProperties: function() {
    this.get('campaign').set('media_plan', this.s3_data);
  }.observes('s3_data'),

  // --- Bind Observers -------------

  _saveCampaignModel: function(campaign) {
    campaign.save().then(
      function() {
        if (campaign.get('id')) {
          this._setSuccessFlash();
          this.transitionToRoute('campaigns.media_plan', campaign);
        } 
      }.bind(this),
      function(reason) {
        this.set('campaign_errors', reason.errors);
      }.bind(this)
    );
  },

  _setSuccessFlash: function() {
    this.get('controllers.flash').createFlash({
      type: 'success', 
      message: 'Campaign successfully created'
    });
  },

  // --- Set View Actions -------------

  actions: {
    createCampaign: function() {
      var campaign = this.get('campaign');
      this._saveCampaignModel(campaign);
    }
  }
});