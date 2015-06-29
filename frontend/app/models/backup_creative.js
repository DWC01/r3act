import DS from 'ember-data';

export default DS.Model.extend({
name:           		DS.attr('string'),
meta_data:      		DS.attr('string'),
extension:      		DS.attr('string'),
resource_url:   		DS.attr('string'),
landing_page_url:   DS.attr('string'),
width:          		DS.attr('string'),
height:         		DS.attr('string'),
dimensions:     		DS.attr('string'),
size:           		DS.attr('string'),
mime_type:      		DS.attr('string'),
etag:           		DS.attr('string'),
		
created_at:     		DS.attr('date'),
updated_at:     		DS.attr('date'),
  		
flight:         		DS.belongsTo('flight'),
campaign:       		DS.belongsTo('campaign'),
creative:       		DS.belongsTo('creative')
});