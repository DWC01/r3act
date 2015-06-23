import Ember from 'ember';
import EmberUploader from 'ember-uploader';

export default EmberUploader.FileField.extend({

  filesDidChange: (function() {    
    var file      = this.get('files')[0];
    this.sendAction('setFileName', file.name);

    var uploadUrl = this.get('url');
    var uploader  = EmberUploader.S3Uploader.create({url: uploadUrl});

    this._bindUploader(uploader);
    this._sign_and_upload_file_to_s3(uploader, file);

  }).observes('files'),

  _bindUploader: function(uploader) {
    uploader.on('didUpload', function(response) {
      this._set_s3_data(response);
    }.bind(this));
  },

  _sign_and_upload_file_to_s3: function(uploader,file) {
    var data = {model: this.get('model')};

    if (!Ember.isEmpty(file)) {
      uploader.upload(file, data);
    }
  },

  _set_s3_data: function(response) {
    var s3_data = this._construct_s3_data(response);
    this.set('s3_data', s3_data);
    if (this.get('setS3data')) {
      this.sendAction('setS3data', JSON.parse(s3_data));
    }
  },

  _construct_s3_data: function(response) {
    var data = {};
    data.file = this.get('files')[0];
    data.key = Ember.$(response).find('Key')[0].textContent;
    data.etag = Ember.$(response).find('ETag')[0].textContent;
    data.bucket = Ember.$(response).find('Bucket')[0].textContent;
    data.tmp_file_path = Ember.$(response).find('Location')[0].textContent;

    return this._construct_s3_data_object(data);
  },

  _construct_s3_data_object: function(data) {
    return JSON.stringify({
      key: data.key,
      etag: data.etag, 
      bucket: data.bucket,
      name: data.file.name,
      mime_type: data.file.type,
      tmp_file_path: data.tmp_file_path
    });
  }

});