class MediaPlan
  attr_reader :csv, :all_rows, :basics, :set_flights, :ad_tag_atts

  def initialize(schedule_file_path)
    @csv = Roo::Spreadsheet.open(schedule_file_path)
    
    @all_rows            = set_all_rows(csv)
    @basics              = campaign_basics
    flights              = set_flights
    @ad_tag_atts         = set_ad_tag_atts(flights.clone)
  end

  # Returns two dimensional array, only rows with data
  def set_all_rows(csv)
    rows=[]
    (csv.first_row..csv.last_row).map {|r| rows.push csv.row(r)}
    rows
  end

  # Returns hash, campaign attribute => value
  def campaign_basics
    campaign_basics={}
    all_rows.each_with_index do |row, index|
      if index < 6
        campaign_basics[to_snake_case(row.first)] = row.second
      end
    end
    campaign_basics
  end

  # Returns hash, flight name => [array of rows in flight, including header]
  def set_flights
    flights={}

    all_rows.each_with_index do |row, index|
      next unless first_flight_row(row)
      
      header_index = index+3
      flight_header = all_rows[header_index]
      row_length = row_length(flight_header)

      flights[name(row,index)] = get_flight(header_index, row_length)
    end

    flights
  end

  def set_ad_tag_atts(flights)
    atts = []



    flights.values.each do |flight|
      flight_atts=[]
      header = arr_to_snake_case(flight.shift)

      flight.each do |row|
        flight_atts.push Hash[header.zip(row)]
      end

      atts.push flight_atts
    end

    atts.inspect
  end
 
  private

  # Returns array, only rows for this flight, including header
  def get_flight(index, row_length)
    flight=[]
    until all_rows[index].first == nil
      flight.push clean_row(all_rows[index], row_length)
      break if index >= all_rows.length-1
      index += 1
    end
    flight
  end

  # Returns integer, finds length of row with selected header
  def row_length(row)
    row.each_with_index do |value,index|
      return (index-1) if value.strip == '-- Select Attribute  --'
    end
  end
  
  # Returns array, only portion with selected header
  def clean_row(row,row_length)
    row = clean_row_length(row,row_length)
    clean_row_vals(row)
  end

  def first_flight_row(row)
    row.first != nil && row.first.strip == 'Flight Name:'
  end

  def clean_row_vals(row)
    row.map! {|val| val.to_s.strip unless val.blank?}
  end

  def clean_row_length(row,row_length)
    row[0..row_length]
  end
  
  def name(row,index)
    row.second+"__#{index}"
  end

  def arr_to_snake_case(string)
    string.map! {|val| to_snake_case(val)}
  end

  def to_snake_case(string)
    string.gsub(":","").strip.downcase.gsub(" ","_")
  end

end