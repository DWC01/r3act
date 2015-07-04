/* global $ */
import Ember from 'ember';

export default Ember.Component.extend({
	
	classNames: ['embed-tag-wrap'],


	didInsertElement: function() {
  	$('.test-page-creative-wrap').width(this.get('creative').get('width'));
		this.rerenderEmbededFlash();
	},

	rerenderEmbededFlash: function() {
		var embededFlash = $('.embed-tag-element').first();
		embededFlash.remove();
		$(embededFlash).attr('src', this.get('creative').get('resource_url'));
		$(this.element).append(embededFlash);
	} 

}); 

