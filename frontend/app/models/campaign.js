import DS from 'ember-data';

export default DS.Model.extend({
  company:                  DS.belongsTo('company'),
  flights:                  DS.hasMany('flight'),
  ad_sizes:                 DS.attr('string', {defaultValue: [] }),
  ad_tag_provider:          DS.attr('string'),
  ad_tag_receivers:         DS.attr('string', {defaultValue: [] }),
  ad_tag_sender:            DS.attr('string'),
  ad_tags_count:            DS.attr('string'),
  ad_tags_file:             DS.attr('string'),
  ad_devices:               DS.attr('string', {defaultValue: [] }),
  ad_formats:               DS.attr('string', {defaultValue: [] }),
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
