class CsvSchedule

  def initialize(campaign)
   @campaign = campaign 
   @csv = Roo::Spreadsheet.open(campaign.ad_tags_file_url.to_s) 
  end

end