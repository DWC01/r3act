import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['flash'],

  media_plan_key: undefined,
      
  _setCampaignProperties: function() {
    return this.getProperties('media_plan_key');
  },

  _clearCampaignProperties: function() {
    this.setProperties({media_plan_key: undefined});
  },

  _createCampaignModel: function() {
    var properties = this._setCampaignProperties();
    return this.store.createRecord('campaign', properties);
  },

  _destroyCampaignModel: function(campaign) {
    this._clearCampaignProperties();
    campaign.deleteRecord();
  },

  _setFlashMessage: function(name) {
    this._flash('success',this._flashMsg(name));
  },

  _flash: function(type, message) {
    this.get('controllers.flash').createFlash({
      type: type, message: message
    });
  },

  _flashMsg: function(name) {
    return name + ' successfully created!';
  },

  _saveCampaignModel: function(campaign) {
    campaign.save().then(
      function() {
        if (campaign.get('id')) {
          this._setFlashMessage(campaign.get('name'));
          this._destroyCampaignModel(campaign);
          this.transitionToRoute('campaigns.show', campaign);
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