import DS from 'ember-data';

export default DS.Model.extend({
  campaign:             DS.belongsTo('campaign'),
  ad_tags:              DS.hasMany('ad_tag'),
  creatives:            DS.hasMany('creative',{embedded: 'always'}),

  tags:                 DS.attr(), 
  name:                 DS.attr('string'),
  adserver_cost:        DS.attr('string'),
  start_date:           DS.attr('string'),
  end_date:             DS.attr('string'),
  ad_tag_count:         DS.attr('string'),
  campaign_id:          DS.attr('number'),
  created_at:           DS.attr('date'),
  updated_at:           DS.attr('date')
});