class AddFlightToAdTags < ActiveRecord::Migration
  def change
    add_column :ad_tags, :flight, :string
  end
end
