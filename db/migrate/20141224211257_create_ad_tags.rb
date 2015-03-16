class CreateAdTags < ActiveRecord::Migration
  def change
    create_table :ad_tags do |t|
      t.string    :ad_type
      t.string    :advertiser   #Brand (typically main client of agency)
      t.string    :audience     #Speciefied audience for campaign
      t.string    :cost_basis   #Advertiser/Client cost method
      t.string    :client_cost  #Cost to Client
      t.string    :cost_method  #Publisher cost method
      t.string    :days         #Days of week ad is allowed to run
      t.string    :details      #Any additional details
      t.string    :device       #Device type the media is to be run on
      t.string    :end_date     #End date of campaign
      t.string    :format       #Format of displaying media
      t.string    :height       #Ad height
      t.string    :impressions      #Projected impression count
      t.string    :javascript_tag   #The JavaScript Code that displays this ad unit
      t.string    :publisher        #Individual or company that owns a venue on which ad space is offered for sale.
      t.string    :media_plan_name  #Media Plan / Campaign Name
      t.string    :placement        #An exact description of the inventory you are purchasing from the publisher.
      t.string    :primary_target_audience
      t.string    :product
      t.string    :properties
      t.string    :size
      t.string    :site
      t.string    :start_action
      t.string    :start_date
      t.string    :total_cost
      t.string    :unit_cost
      t.string    :width
      t.integer   :flight_id

      t.timestamps
    end
  end
end
