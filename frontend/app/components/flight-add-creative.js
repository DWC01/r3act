import Ember from 'ember';

export default Ember.Component.extend({
  
  // --- Initialize ------
  didInsertElement: function() {
		this.clearAll();
  },

  // --- Destructor ------
  willDestroyElement: function() {

  }, 

  // --- Set Clear -------------
  clearAll: function() {
    this.setProperties({
      s3_data: undefined
    });
  },

  _setCreativeMetaData: function() {
    this.sendAction('setCreativeMetaData', this.get('s3_data'));
  }.observes('s3_data'),


	actions: {
    setS3data: function(s3_data) {
      this.set('s3_data', s3_data); 
    },
		createCreative: function() {
			this.sendAction('createCreative');
		}
	}
});
