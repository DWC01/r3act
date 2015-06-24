import DS from 'ember-data';

export default DS.Model.extend({
  name:                   DS.attr('string'), 
  width:                  DS.attr('string'),
  height:                 DS.attr('string'),
  dimensions:             DS.attr('string'),
  creative_landing_page:  DS.attr('string'),

  created_at:             DS.attr('date'),
  updated_at:             DS.attr('date'),
  
  flight:                 DS.belongsTo('flight')
});