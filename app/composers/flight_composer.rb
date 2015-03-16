class FlightComposer
  attr_reader :attributes

  def initialize(all_rows)
    @all_rows = all_rows
    set_flight_start_indexes
    set_attributes
  end

  def set_flight_start_indexes
    @flight_start_indexes=[]
    @all_rows.each_with_index do |row, index|
      next unless first_flight_row(row)
      @flight_start_indexes << index
    end
  end

  def set_attributes 
    @attributes=[]
    @flight_start_indexes.each do |index|
      @attributes << attributes_attrs(index)
    end
  end

  def attributes_attrs(index)
    name = @all_rows[index].second
    adserving_cost = @all_rows[index+1].second
    {'name' => name, 'adserver_cost' => adserving_cost.to_s}
  end
 
  private

  def first_flight_row(row)
    row.first != nil && row.first.strip == 'Flight Name:'
  end
  
  def flight_name(index)
    @all_rows[index].second+"__#{index}"
  end

  def adserving_cost(index)
    all_rows[index+1].second
  end

end