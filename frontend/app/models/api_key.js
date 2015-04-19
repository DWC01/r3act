import DS from 'ember-data';

export default DS.Model.extend({
  user:         DS.belongsTo('user'),

  access_token: DS.attr('string'),
  user_id:      DS.attr('number'),
  created_at:   DS.attr('date'),
  updated_at:   DS.attr('date')
});
