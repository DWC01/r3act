class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.string   :title
      t.string   :category
      t.string   :size

      t.timestamps
    end
  end
end
