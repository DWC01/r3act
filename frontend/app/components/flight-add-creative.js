import Ember from 'ember';

export default Ember.Component.extend({
  
  // --- Initialize ------
  didInsertElement: function() {
    this.sendAction('clearCreativeErrors');
  },

  // --- Destructor ------
  willDestroyElement: function() {
    this.sendAction('clearCreativeProperties');
    this.sendAction('clearCreativeErrors');
  },

  isCreative: true,

  isAdTag: false,

  setIsCreative: function() {
    return this.get('isCreative');
  }.property('isCreative'), 
  
  setIsAdTag: function() {
    return this.get('isAdTag');
  }.property('isAdTag'),

  _setCreativeMetaData: function() {
    this.sendAction('setCreativeMetaData', this.get('s3_data'));
  }.observes('s3_data'),

  actions: {
    toggleCreativeType: function() {
      this.toggleProperty('isCreative');
      this.toggleProperty('isAdTag');

      if (this.get('isCreative')) {
        this.get('creative').set('creative_type','main-creative');
      } else {
        this.get('creative').set('creative_type','main-ad-tag');
      }
    },
    setS3data: function(s3_data) {
      this.set('s3_data', s3_data); 
    },
		createCreative: function() {
			this.sendAction('createCreative');
		},
    clearCreativeProperties: function() {
      this.sendAction('clearCreativeProperties');
    },
    clearCreativeErrors: function() {
      this.sendAction('clearCreativeErrors');
    }
	}
});
