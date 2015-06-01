import DS from 'ember-data';

export default DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,{
  attrs: {
    ad_tags: { embedded: 'always' },
    creatives: { embedded: 'always' }
  }
});