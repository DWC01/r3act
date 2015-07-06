class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string   :name
	    t.string   :logo
	    t.string   :street
	    t.string   :city
	    t.string   :state
	    t.integer  :zip
	    t.string   :description
	    t.text     :detailed_description
	    t.string   :founders
	    t.string   :month_founded
	    t.string   :year_founded
	    t.string   :aquired_by
	    t.string   :company_size
	    t.string   :status
	    t.string   :website_url
	    t.string   :facebook_url
	    t.string   :twitter_url
	    t.string   :linkedin_url
	    t.string   :email_url
	    t.boolean  :media_agency
	    t.boolean  :ad_server
	    t.boolean  :creative_optimization
	    t.boolean  :verification
	    t.boolean  :measurement
	    t.boolean  :data_supplier
	    t.boolean  :data_management_platform
	    t.boolean  :demand_side_platform
	    t.boolean  :trade_desk
	    t.boolean  :media_buyer
	    t.boolean  :retargeting
	    t.boolean  :ad_exchange
	    t.boolean  :ad_network
	    t.boolean  :supply_side_platform
	    t.boolean  :publisher
	    t.boolean  :display
	    t.boolean  :mobile
	    t.boolean  :video
	    t.boolean  :social
	    t.string   :click_macro
	    t.string   :escaped_click_macro
	    t.string   :advertiser_id_macro
	    t.string   :ad_id_macro
	    t.string   :campaign_id_macro
	    t.string   :network_id_macro
	    t.string   :site_id_macro
	    t.string   :page_id_macro
	    t.string   :placement_id_macro
	    t.string   :creative_id_macro
	    t.string   :page_url_macro
	    t.string   :cachebuster_macro
	    t.text     :csv_header
            
      t.timestamps
    end
  end
end