class AddAudienceToAdTags < ActiveRecord::Migration
  def change
    add_column :ad_tags, :audience, :string
  end
end
