import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['placement-table-cell'],

  classNameBindings: ['ad_tag.isEditing:editing'],

  doubleClick : function(){
    this.get('ad_tag').set('isEditing', true);
  }
  
});
