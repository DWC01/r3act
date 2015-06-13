import Ember from 'ember';

export default Ember.Component.extend({

	// --- Set Clear -------------

  clearAll: function() {
    this.setProperties({
      creative: undefined, s3_data: undefined,
      flight_id: undefined
    });
  },

  _setCreativeMetaData: function() {
    var meta_data = this.get('s3_data');
    meta_data.flight_id = this.get('flight').get('id');

    this.get('creative').set('meta_data', JSON.stringify(meta_data));
  }.observes('s3_data'),

  // --- Initialize -------------

  didInsertElement: function() {
		this.clearAll();
    this.set('creative', 
        this.get('parentController').store.createRecord('creative'));
  },

	actions: {
    setS3data: function(s3_data) {
      this.set('s3_data', s3_data); 
    },
		createCreative: function() {
			this.get('creative').save();
		}
	}
});
