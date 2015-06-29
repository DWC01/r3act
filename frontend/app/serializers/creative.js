import DS from 'ember-data';

export default DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,{
  attrs: {
    backup_creative: { embedded: 'always' }
  }
});