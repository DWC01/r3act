class FlightComposer
  attr_reader :all_rows, :ad_tag_attributes, :flight_basics, :group_placements

  def initialize(all_rows)
    @all_rows = all_rows
    set_flight_start_indexes
    set_flight_basics
    group_placements
    set_ad_tag_attributes(@placements.clone)
  end

  def set_flight_start_indexes
    @flight_start_indexes=[]
    @all_rows.each_with_index do |row, index|
      next unless first_flight_row(row)
      @flight_start_indexes << index
    end
  end

  def set_flight_basics 
    @flight_basics=[]
    @flight_start_indexes.each do |index|
      @flight_basics << flight_basics_attrs(index)
    end
  end

  def flight_basics_attrs(index)
    name = @all_rows[index].second
    adserving_cost = @all_rows[index+1].second
    {'name' => name, 'adserver_cost' => adserving_cost.to_s}
  end

  # Returns hash, flight name => [array of rows in flight, including header]
  def group_placements
    @placements={}
    @flight_start_indexes.each do |index|
      config_and_set_placement(index)
    end
    @placements
  end

  def config_and_set_placement(index)
    header_index      = index+3
    placements_header = @all_rows[header_index]
    row_length        = row_length(placements_header)

    @placements[flight_name(index)] = get_placement(header_index, row_length)
  end


  def set_ad_tag_attributes(placements)
    @ad_tag_attributes = []

    placements.values.each do |placement|
      placement_atts=[]
      header = arr_to_snake_case(placement.shift)

      placement.each do |values|
        placement_atts.push Hash[header.zip(values)]
      end

      @ad_tag_attributes.push placement_atts
    end
  end
 
  private

  # Returns array, only placements for this flight, including header
  def get_placement(index, row_length)
    placement=[]
    until all_rows[index].first == nil
      placement.push clean_row(all_rows[index], row_length)
      break if index >= all_rows.length-1
      index += 1
    end
    placement
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
  
  def flight_name(index)
    @all_rows[index].second+"__#{index}"
  end

  def adserving_cost(index)
    all_rows[index+1].second
  end

  def arr_to_snake_case(string)
    string.map! {|val| to_snake_case(val)}
  end

  def to_snake_case(string)
    string.gsub(":","").strip.downcase.gsub(" ","_")
  end

end