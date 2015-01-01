module CampaignMethods

  def save_file_as_ad_tags(campaign, file_path)
    csv = CaratSchedule.new(file_path)
    AdTag.save_tags(campaign, csv.placements)
  end

end

