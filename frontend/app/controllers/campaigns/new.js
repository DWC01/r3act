import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['flash'],

  s3_key: undefined,
      
  _setCampaignProperties: function() {
    return {media_plan: this.get('s3_key')};
  },

  _clearCampaignProperties: function() {
    this.setProperties({s3_key: undefined});
  },

  _createCampaignModel: function() {
    var properties = this._setCampaignProperties();
    return this.store.createRecord('campaign', properties);
  },

  _destroyCampaignModel: function(campaign) {
    this._clearCampaignProperties();
    campaign.deleteRecord();
  },

  _setFlashMessage: function() {
    this._flash('success', 'Campaign successfully created');
  },

  _flash: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: type, message: message
    });
  },

  _saveCampaignModel: function(campaign) {
    campaign.save().then(
      function() {
        if (campaign.get('id')) {
          this._setFlashMessage(campaign.get('name'));
          this._destroyCampaignModel(campaign);
          this.transitionToRoute('campaigns.media_plan', campaign);
        } 
      }.bind(this),
      function(reason) {
        this.set('campaign_errors', reason.errors);
      }.bind(this)
    );
  },

  actions: {
    createCampaign: function() {
      var campaign = this._createCampaignModel();
      this._saveCampaignModel(campaign);
    }
  }
});