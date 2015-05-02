class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string   :name
      t.string   :placements_trafficked
      t.string   :placement_rate
            
      t.timestamps
    end
  end
end
