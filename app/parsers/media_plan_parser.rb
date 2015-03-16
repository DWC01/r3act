class MediaPlanParser
  attr_reader :all_rows, :flight_ad_tags_atts

  def initialize(schedule_file_path)
    @csv = Roo::Spreadsheet.open(schedule_file_path)
    set_all_rows(@csv)

    @campaign = CampaignComposer.new(@all_rows)
    @flight   = FlightComposer.new(@all_rows)
    @ad_tag   = AdTagComposer.new(@all_rows)

    set_flight_ad_tags_atts
  end

  # Returns two dimensional array of only rows with data
  def set_all_rows(csv)
    @all_rows=[]
    (csv.first_row..csv.last_row).map {|r| @all_rows.push csv.row(r)}
  end

  def campaign_atts
    @campaign.attributes
  end

  def flights_atts
    @flight.attributes
  end

  def ad_tags_atts
    @ad_tag.attributes
  end

  def data_check_passed?
    flights_atts.length == ad_tags_atts.length
  end

  def set_flight_ad_tags_atts
    @flight_ad_tags_atts=[]
    flights_atts.each_with_index do |flight_atts, index|
      @flight_ad_tags_atts << [ flight_atts, ad_tags_atts[index] ]
    end
  end


end