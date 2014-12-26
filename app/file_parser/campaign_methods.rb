module CampaignMethods

  def save_file_as_ad_tags(campaign)
    csv = CsvSchedule.new(campaign)
    puts csv
  end

end