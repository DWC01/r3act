class CsvSchedule
  attr_reader :csv, :all_data, :header_index, :header, 
              :all_data_hash, :flight_hash, :target_hash,
              :placement_hash

  def initialize(schedule_file_path)
   @csv = Roo::Spreadsheet.open(schedule_file_path)
   
   @all_data        = set_all_data(csv)
   @header_index    = get_header_row_index(all_data.clone)
   @header          = set_header(all_data.clone)
   @all_data_hash   = set_all_data_hash

   @flight_hash     = set_flight_hash(all_data_hash.clone)
   @target_hash     = set_target_hash(all_data_hash.clone)
   @placement_hash  = set_placement_hash(all_data_hash.clone)

  end

  # returns only rows with data
  def set_all_data(csv)
    all_data=[];
    (csv.first_row..csv.last_row).each {|r| all_data << csv.row(r)}
    all_data
  end


  #-------------------#
  #      Header       #
  #-------------------#

  # looks for first row that has data in index[0] 
  # and contains "total cost" at some point in the row

  # if encounters a row that is merged, pops it off
  # and recursively looks for..

  def set_header(data)
    header = get_header(data)
    return header if header.last == "total_cost"
      
    all_data.shift
    set_header(all_data)
  end

  def get_header_row_index(data)
    data.each_with_index do |row, index|
      return index unless row[0].blank?
    end
  end

  def get_header(data)
    headers=[]
    data[header_index].each do |header|
      unless header.blank? 
        header = header.downcase
        header = filter_header(header)
      end
      headers.push header
      break if header == "total_cost"
    end
    headers.compact
  end

  def last_index
    header.length-1
  end

  #-------------------#
  #   All Data Hash   #
  #-------------------#

  def set_all_data_hash
    array = [];
    # Set Giant Hash With EVERYTHING
    (csv.first_row..csv.last_row).each do |i|
      array.push Hash[header.zip(csv.row(i)[0..last_index])]
    end
    array
  end

  #-------------------#
  #      Flight       #
  #-------------------#

  def set_flight_hash(all_data)
    flights=[]
    all_data.each do |row|
      if flight_row?(row)
        flights.push row
      end
    end
    flights
  end

  def flight_row?(row)
    if first_value_exist?(row) && remaining_rows_blank?(row) && !restricted_values?(row)
      return true
    end
    false
  end


  def restricted_values?(row)
    row = row.values
    row.first == "Radio"
  end


  #-------------------#
  #      Target       #
  #-------------------#

  def set_target_hash(all_data)
    targets=[]
    all_data.each do |row|
      if target_row?(row)
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

  #-------------------#
  #   Placement       #
  #-------------------#

  def set_placement_hash(all_data)
    placements=[]
    all_data.each do |row|
        
        if first_value_exist?(row)
          @site = row.first[1]  
        end
        
        if row["scheduling"]
          row["scheduling"] = @site
        end

        if row["schedule details"]
          row["schedule details"] = @site
        end

        if row["placement"] && !row["placement"].blank?
          @placement = row["placement"]
        end
        row["placement"] = @placement

        if row["total cost"] && !row["total cost"].blank?
           @total_cost = row["total cost"]
        end
        row["total cost"] = @total_cost

        
      if placement_row?(row) 
        placements.push  row
      end
    end
    placements #.delete_if {|index, row| row.include?("30 seconds") || row.include?("15 seconds") || row.include?("Adserving")}
  end

  def placement_row?(row)
    return false unless last_value_exist?(row)
    return false unless detail_value_exists?(row)
    return false unless restricted_placement_values?(row)

    return false if header_row?(row)
    true
  end

  #-------------#
  #   Filters   #
  #-------------#

  def header_row?(row)
    row = row.values
    if row[last_index].class == String 
      return row[last_index].downcase == "total cost"
    end
  end

  def first_value_exist?(row)
    row = row.values
    !row.first.blank?
  end

  def second_value_exist?(row)
    row = row.values
    !row[1].blank?
  end

  def last_value_exist?(row)
    row = row.values
    !row[last_index].blank?
  end

  def detail_value_exists?(row)
    !row["detail"].blank? ||
    !row["product / detail"].blank? ||
    !row["placement"].blank?

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

  def restricted_placement_values?(row)
    return false if row.has_value?("15 seconds")
    return false if row.has_value?("30 seconds")
    return false if row.has_value?("Adserving")
    true
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
      header.gsub("gross digital cost", "total_cost")
    when "cost"
      header.gsub("cost", "unit_cost")
    when "total cost"
      header.gsub("total cost", "total_cost")
      
    else
      header
    end

  end

end