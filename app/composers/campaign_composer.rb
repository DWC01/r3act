class CampaignComposer
  attr_reader :attributes

  def initialize(all_rows)
    @all_rows = all_rows
    set_attributes
  end

  # Returns hash, campaign attribute => value
  def set_attributes
    @attributes={}
    
    @all_rows.each_with_index do |row, index|
      break if index >=6
      value = row.second
      attribute = clean_atts(row.first)
      @attributes[attribute] = value
    end
  end

  private

  def clean_atts(string)
    string = filter_atts(string)
    to_snake_case(string)
  end

  def filter_atts(string)
    string.gsub("Campaign Name", "name")
  end

  def to_snake_case(string)
    string = string.gsub(":","").strip.downcase.gsub(" ","_")
  end


end