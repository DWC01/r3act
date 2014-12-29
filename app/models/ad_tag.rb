class AdTag < ActiveRecord::Base

  def self.save_csv_tag_file(csv)
    csv.header_row_hash.each do |ad_tag_atts|
      save_new_ad_tag(ad_tag_atts)
    end
  end

end
