class AddTotalDigitalCostToAdTags < ActiveRecord::Migration
  def change
    add_column :ad_tags, :total_digital_cost, :string
  end
end
