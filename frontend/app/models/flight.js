import DS from 'ember-data';

export default DS.Model.extend({
  campaign:       DS.belongsTo('campaign'),
  adTags:         DS.hasMany('adTag'),
  name:           DS.attr('string'),
  adserver_cost:  DS.attr('string'),
  start_date:     DS.attr('string'),
  end_date:       DS.attr('string'),
  ad_tag_count:   DS.attr('string'),
  campaign_id:    DS.attr('integer'),
  createdAt:      DS.attr('date'),
  updatedAt:      DS.attr('date')
});