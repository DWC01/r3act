import DS from 'ember-data';

export default DS.Model.extend({
  company:                  DS.belongsTo('company'),
  flights:                  DS.hasMany('flight'),
  // flight_ids:               DS.attr(),
  
  ad_sizes:                 DS.attr(),
  ad_tag_receivers:         DS.attr(),
  ad_devices:               DS.attr(),
  ad_formats:               DS.attr(),
  ad_tag_provider:          DS.attr('string'),
  ad_tag_sender:            DS.attr('string'),
  ad_tags_count:            DS.attr('string'),
  media_plan_key:           DS.attr('string'),
  advertiser:               DS.attr('string'),
  end_date:                 DS.attr('string'),
  media_plan_name:          DS.attr('string'),
  name:                     DS.attr('string'),
  primary_target_audience:  DS.attr('string'),
  start_date:               DS.attr('string'),
  company_id:               DS.attr('number'),
  created_at:               DS.attr('date'),
  updated_at:               DS.attr('date')
});
