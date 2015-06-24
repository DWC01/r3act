import DS from 'ember-data';

export default DS.Model.extend({

url: 										DS.attr('string'),
name: 									DS.attr('string'),
etag: 									DS.attr('string'),
size: 									DS.attr('string'),
width: 									DS.attr('string'),
height: 								DS.attr('string'),
version: 								DS.attr('string'),
swf_xmax: 							DS.attr('string'),
swf_ymax: 							DS.attr('string'),
duration: 							DS.attr('string'),
extension: 							DS.attr('string'),
bit_count: 							DS.attr('string'),
mime_type: 							DS.attr('string'),
meta_data: 							DS.attr('string'),
signature: 							DS.attr('string'),
frame_rate: 						DS.attr('string'),
compressed: 						DS.attr('string'),
avm_version: 						DS.attr('string'),
creative_id: 						DS.attr('string'),
frame_count: 						DS.attr('string'),
creative_type: 					DS.attr('string'),
creative_landing_page: 	DS.attr('string'),

created_at:             DS.attr('date'),
updated_at:             DS.attr('date'),

creative:               DS.belongsTo('creative')

});