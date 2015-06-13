class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :name
      t.string :mime_type
      t.string :s3_data
      t.string :original_url
      t.string :profile_url
      t.string :nav_url
      t.integer :user_id
      t.integer :company_id
  
      t.timestamps
    end
  end
end
