class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string   :name
      t.string   :logo_original
      t.string   :logo_profile
      t.string   :logo_list
      t.string   :placements_trafficked
      t.string   :placement_rate
            
      t.timestamps
    end
  end
end
