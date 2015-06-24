class CreateAdTagCreatives < ActiveRecord::Migration
  def change
    create_table :ad_tag_creatives do |t|

      t.timestamps null: false
    end
  end
end
