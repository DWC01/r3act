import DS from 'ember-data';

export default DS.Model.extend({
  flight:       DS.belongsTo('flight'),
  
  name:         DS.attr('string'),
  mime_type:    DS.attr('string'),
  s3_data:      DS.attr('string'),
  width:        DS.attr('string'),
  height:       DS.attr('string'),
  dimensions:   DS.attr('string'),
  flight_id:    DS.attr('number'),
  created_at:   DS.attr('date'),
  updated_at:   DS.attr('date')
});