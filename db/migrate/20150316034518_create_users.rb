class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :avatar
      t.string   :position
      t.string   :title
      t.string   :password_digest
      t.string   :auth_token
      t.string   :password_reset_token
      t.string   :password_reset_sent_at
      t.boolean  :admin
      t.integer  :company_id

      t.timestamps
    end
  end
end
