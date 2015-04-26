import Ember from 'ember';
import FileField from 'ember-uploader/file-field';
import S3Uploader from 'ember-uploader/s3';

export default FileField.extend({

  filesDidChange: (function() {
    var files, uploader, uploadUrl;
    
    files     = this.get('files');
    uploadUrl = this.get('url');
    uploader  = S3Uploader.create({url: uploadUrl});

    uploader.on('didUpload', function(response) {
      this._set_media_plan_key(response);
    }.bind(this));

    this._upload_file_to_s3(uploader, files);
  }).observes('files'),

  _upload_file_to_s3: function(uploader,files) {
    if (!Ember.isEmpty(files)) {
      uploader.upload(files[0]);
    }
  },

  _set_media_plan_key: function(response) {
    var media_plan_key = Ember.$(response).find('Key')[0].textContent;     
    this.set('media_plan_key', media_plan_key);
  }

});