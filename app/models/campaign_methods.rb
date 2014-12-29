module CampaignMethods

  def save_file_as_ad_tags(file_path)
    csv = CaratSchedule.new(file_path)
    AdTag.save_tags(csv.placements)
  end

end

