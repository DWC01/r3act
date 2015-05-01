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
      this._set_s3_key(response);
    }.bind(this));

    this._upload_file_to_s3(uploader, files);
  }).observes('files'),

  _upload_file_to_s3: function(uploader,files) {
    var data = {
      model: this.get('model'),
      attribute: this.get('attribute')
    };

    if (!Ember.isEmpty(files)) {
      uploader.upload(files[0], data);
    }
  },

  _set_s3_key: function(response) {
    var s3Key = Ember.$(response).find('Location')[0].textContent;     
    this.set('s3_key', s3Key);
  }

});