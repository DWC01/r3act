class CampaignComposer
  attr_reader :all_rows, :campaign_basics

  def initialize(all_rows)
    @all_rows = all_rows
    set_campaign_basics
  end

  # Returns hash, campaign attribute => value
  def set_campaign_basics
    @campaign_basics={}
    
    @all_rows.each_with_index do |row, index|
      break if index >=6
      value = row.second
      attribute = to_snake_case(row.first)
      @campaign_basics[attribute] = value
    end
  end

  private

  def to_snake_case(string)
    string.gsub(":","").strip.downcase.gsub(" ","_")
  end

end