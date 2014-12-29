class CaratSchedule
  attr_reader :csv, :all_rows, :header_index, :header, 
              :all_rows_hashes, :flights, :targets,
              :placements, :flight_index

  def initialize(schedule_file_path)
   @csv = Roo::Spreadsheet.open(schedule_file_path)
   
   @all_rows        = set_all_rows(csv)

   @header_index    = set_header_row_index(all_rows)
   @header          = set_header(all_rows)

   @all_rows_hashes = set_all_rows_as_hashes

   @flights         = set_flights(all_rows_hashes)
   @flight_index    = set_flight_index

   @targets         = set_targets(all_rows_hashes)

   @placements      = set_placements(all_rows_hashes)
  end


  #-------------------#
  #   All Data Hash   #
  #-------------------#

  # Returns only rows with data - as an array of arrays
  def set_all_rows(csv)
    rows=[]
    (csv.first_row..csv.last_row).map {|r| rows << csv.row(r)}
    rows
  end

  # Returns only rows with data - as an array of hashes
  def set_all_rows_as_hashes
    rows = [];
    (csv.first_row..csv.last_row).each do |i|
      rows.push Hash[header.zip(csv.row(i)[0..last_index])]
    end
    rows
  end

  #-------------------#
  #      Header       #
  #-------------------#

  def set_header_row_index(all_rows)
    all_rows.each_with_index do |row, index|
      if !row.first.blank? && contains_header_values(row)
        return index
      end
    end
  end

  def set_header(all_rows)
    header = return_header_values(all_rows)
    return header if header.last == "total_cost"
      
    # Todo - Raise some type of Error / Alert
    puts "Could Not Find A Header Value.."
  end

  def return_header_values(all_rows)
    headers_vals=[]
    all_rows[header_index].each do |value|
      unless value.blank? 
        value = value.downcase
        value = filter_header(value)
      end
      headers_vals.push value.strip
      break if value == "total_cost"
    end
    headers_vals.compact
  end

  def last_index
    header.length-1
  end

  # EXTRACT
  # Takes array as argument
  # Returns true if finds values typically found in media plan header
  def contains_header_values(row)
    (row.include?("TOTAL COST") || row.include?("Total Cost") || row.include?("SCHEDULE DETAILS") || row.include?("SCHEDULE")|| row.include?("Placement") )
  end


  #-------------------#
  #      Flight       #
  #-------------------#

  # Assumes that all_rows is an array of hashes
  def set_flights(all_rows)
    flights=[]
    all_rows.each_with_index do |row, index|
      if flight_row?(row)
        put_flight_value_in_row(row,index)
        flights.push row
      end
    end
    flights
  end

  def flight_row?(row)
    if first_value_exist?(row) && remaining_rows_blank?(row) && !restricted_flight_values?(row)
      return true
    end
    false
  end

  def put_flight_value_in_row(row,index)
    array = row.values
    row["flight"] = array.first
    row["index"] = index
    row.delete_if {|key,value| key == "media_partner" || key == "device" || key == "placement_name" || key == "ad_type" || key == "product" || key == "unit_cost" || key == "impressions" || key == "total_digital_cost" || key == "total_cost" }
  end

  def restricted_flight_values?(row)
    row = row.values
    row.first == "Radio"
  end


  #-------------------#
  #      Target       #
  #-------------------#

  def set_targets(data)
    targets=[]
    data.each_with_index do |row, index|
      if target_row?(row)
        put_target_value_in_row(row, index)
        targets.push row
      end
    end
    targets
  end

  def target_row?(row)
    if only_first_and_last_value_exist?(row)
      return true
    end
    false
  end

  def only_first_and_last_value_exist?(row)
    return false unless first_value_exist?(row)
    return false unless last_value_exist?(row)
    return false unless middle_values_blank?(row)
    true
  end

  def put_target_value_in_row(row, index)
    array = row.values
    row["target"] = array.first
    row["index"] = index
    row.delete_if {|key,value| key == "media_partner" || key == "device" || key == "placement_name" || key == "ad_type" || key == "product" || key == "unit_cost" || key == "impressions" || key == "total_digital_cost" || key == "total_cost" }
  end

  #-------------------#
  #   Placement       #
  #-------------------#

  def set_placements(all_rows)
    placements=[]
    all_rows.each_with_index do |row, index|

      
      if placement_row?(row, index)

        auto_fill_media_partner(row)
        auto_fill_placement_name(row)
        auto_fill_total_cost(row)
        next if restricted_placement?(row)

        # row["index"] = index

        placements.push row
      end

    end
    placements
  end

  def placement_row?(row, index)
    return false if header_row?(index)
    return true  if same_site_name_as_previous(row)

    return false if row_before_first_flight(index)

    return true if placement_name_value_exists?(row) || ad_type_value_exists?(row)

    return false if !last_value_exist?(row)
    return false if last_value_only_value_to_exist?(row)

    true
  end

  #---------------#
  #   Auto Fill   #
  #---------------#

  def auto_fill_media_partner(row)
    if row["media_partner"]
      @site = row["media_partner"]
    end    
    row["media_partner"] = @site
  end

  def auto_fill_placement_name(row)
    if row["placement_name"]
      @name = row["placement_name"]
    end    
    row["placement_name"] = @name
  end

  def auto_fill_total_cost(row)
    if row["total_cost"]
      @cost = row["total_cost"]
    end    
    row["total_cost"] = @cost
  end


  #-------------#
  #   Filters   #
  #-------------#

  def header_row?(index)
    header_index == index
  end

  def first_value_exist?(row)
    row = row.values
    !row.first.blank?
  end

  def same_site_name_as_previous(row)
    @site == row["media_partner"] && row["media_partner"] != nil
  end

  def second_value_exist?(row)
    row = row.values
    !row[1].blank?
  end

  def last_value_exist?(row)
    row = row.values
    !row[last_index].blank?
  end

  def last_value_only_value_to_exist?(row)
    row = row.values
    non_blank_values = 0

    row.each do |value|
      non_blank_values += 1 if !value.blank?
    end

    return true if non_blank_values <= 1 && !row[last_index].blank?
    false
  end

  def set_flight_index
    flight_indexes=[]

    flights.each do |flight|
      flight_indexes.push flight["index"]
    end

    flight_indexes.min
  end

  def placement_name_value_exists?(row)
    !row["placement_name"].blank?
  end

  def media_partner_value_exists?(row)
    !row["media_partner"].blank?
  end

  def ad_type_value_exists?(row)
    !row["ad_type"].blank?
  end

  def remaining_rows_blank?(row)
    row = row.values
    (1..last_index).each do |i|
      return false if !row[i].blank?
    end
    true
  end

  def middle_values_blank?(row)
    row = row.values
    (1...last_index).each do |i|
      return false if !row[i].blank?
    end
    true
  end

  def restricted_placement?(row)
    return true if row.has_value?("15 seconds")
    return true if row.has_value?("30 seconds")
    return true if row.has_value?("Adserving")
    return true if row.has_value?("Production")
    return true if row.has_value?("Management Fee")
    false
  end

  def row_before_first_flight(index)
    index <= flight_index
  end

  def filter_header(header)
    case header
    when "schedule details"
      header.gsub("schedule details","media_partner")
    when "scheduling"
      header.gsub("scheduling","media_partner")
    when "placement"
      header.gsub("placement", "placement_name")
    when "product / detail"
      header.gsub("product / detail", "placement_name")
    when "detail"
      header.gsub("detail", "placement_name")
    when "duration"
      header.gsub("duration", "ad_type")
    when "length"
      header.gsub("length", "ad_type")
    when "unit cost"
      header.gsub("unit cost", "unit_cost")
    when "no."
      header.gsub("no.", "impressions")
    when "number"
      header.gsub("number", "impressions")
    when "gross digital cost"
      header.gsub("gross digital cost", "total_digital_cost")
    when "cost"
      header.gsub("cost", "unit_cost")
    when "total cost"
      header.gsub("total cost", "total_cost")
      
    else
      header
    end

  end

end