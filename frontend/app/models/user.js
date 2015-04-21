import DS from 'ember-data';

export default DS.Model.extend({
  company:                DS.belongsTo('company'),
  
  first_name:             DS.attr('string'),
  last_name:              DS.attr('string'),
  email:                  DS.attr('string'),
  avatar:                 DS.attr('string'),
  position:               DS.attr('string'),
  title:                  DS.attr('string'),
  password:               DS.attr('string'),
  auth_token:             DS.attr('string'),
  password_confirmation:  DS.attr('string'),
  password_reset_token:   DS.attr('string'),
  password_reset_sent_at: DS.attr('date'),
  admin:                  DS.attr('boolean'),
  company_id:             DS.attr('number'),
  created_at:             DS.attr('date'),
  updated_at:             DS.attr('date')
});