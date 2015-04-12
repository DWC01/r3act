import Ember from 'ember';

export default Ember.ArrayController.extend({
  
  needs: ['flash'],
      
  _setCompanyProperties: function() {
    return this.getProperties('name');
  },

  _clearCompanyProperties: function() {
    this.setProperties({name: null});
  },

  _createCompanyModel: function() {
    var properties = this._setCompanyProperties();
    return this.store.createRecord('company', properties);
  },

  _destroyCompanyModel: function(company) {
    this._clearCompanyProperties();
    company.deleteRecord();
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

  _saveCompanyModel: function(company) {
    var _this = this;
    company.save().then(
      function() {
        if (company.get('id')) {
          _this._setFlashMessage(company.get('name'));
          _this._destroyCompanyModel(company);
          _this.transitionToRoute('companies.show', company);
        } 
      },
      function(reason) {
        _this.set('company_errors', reason.errors);
      }
    );
  },

  actions: {
    createCompany: function() {
      var company = this._createCompanyModel();
      this._saveCompanyModel(company);
    }
  }
});