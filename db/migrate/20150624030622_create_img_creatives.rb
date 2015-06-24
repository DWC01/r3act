class CreateImgCreatives < ActiveRecord::Migration
  def change
    create_table :img_creatives do |t|

      t.timestamps null: false
    end
  end
end
