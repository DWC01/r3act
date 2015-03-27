import DS from 'ember-data';

export default DS.Model.extend({
  campaigns:              DS.hasMany('campaign'),
  users:                  DS.hasMany('user'),
  name:                   DS.attr('string'),
  logo:                   DS.attr('string'),
  placements_trafficked:  DS.attr('string'),
  placement_rate:         DS.attr('string'),
  createdAt:              DS.attr('date'),
  updatedAt:              DS.attr('date')
});