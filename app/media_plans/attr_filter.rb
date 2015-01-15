  class AttrFilter
  
  def self.campaign_basics(value)
    case value
    when "brand:"
      value.gsub("brand:","advertiser")
    when "product:"
      value.gsub("product:","product")
    when "period:"
      value.gsub("period:","period")
    when "pta:"
      value.gsub("pta:","primary_target_audience")
    when "date:"
      value.gsub("date:","date")
    when "version:"
      value.gsub("version:","version")
    else
     value
    end
  end

  def self.header(value)
    case value
    when "schedule details"
      value.gsub("schedule details","media_partner")
    when "scheduling"
      value.gsub("scheduling","media_partner")
    when "placement"
      value.gsub("placement", "placement_name")
    when "product / detail"
      value.gsub("product / detail", "placement_name")
    when "detail"
      value.gsub("detail", "placement_name")
    when "duration"
      value.gsub("duration", "ad_type")
    when "length"
      value.gsub("length", "ad_type")
    when "unit cost"
      value.gsub("unit cost", "unit_cost")
    when "no."
      value.gsub("no.", "impressions")
    when "number"
      value.gsub("number", "impressions")
    when "gross digital cost"
      value.gsub("gross digital cost", "total_digital_cost")
    when "cost"
      value.gsub("cost", "unit_cost")
    when "total cost"
      value.gsub("total cost", "total_cost")  
    else
      value
    end
  end

end