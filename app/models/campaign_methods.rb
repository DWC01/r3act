module CampaignMethods

  def save_file_as_ad_tags(file_path)
    csv = CsvSchedule.new(file_path)
    AdTag.save_csv_tag_file(csv.tag_atts)
  end

end

