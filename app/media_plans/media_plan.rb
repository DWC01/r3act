class MediaPlan
  attr_reader :csv, :basics, :flight_rows

  def initialize(schedule_file_path)
    @csv = Roo::Spreadsheet.open(schedule_file_path)
    
    @all_rows            = set_all_rows(csv)
    @basics              = set_campaign_basics(@all_rows)
    @flights             = set_flights(@all_rows)
    puts @flights
  
  end

  # Returns only rows with data - as an array of arrays
  def set_all_rows(csv)
    rows=[]
    (csv.first_row..csv.last_row).map {|r| rows << csv.row(r)}
    rows
  end

  #-------------------#
  #      Basics       #
  #-------------------#

  def set_campaign_basics(all_rows)
    campaign_basics={}
    all_rows.each_with_index do |row, index|
      if index < 6
         campaign_basics[to_snake_case(row.first)] = row.second
      end
    end
    campaign_basics
  end

  def set_flights(all_rows)
    flights={}
    all_rows.each_with_index do |row, index|
      if row.first && row.first.strip == 'Flight Name:'
        flight=[]
        header = index+3
        row_count = row_count(all_rows[header])

         until all_rows[header][0] == nil
            clean_row(all_rows[header], row_count).inspect
            flight.push clean_row(all_rows[header], row_count)

            if header >= all_rows.length - 1
              break
            else 
              header += 1
            end
         end
         flights[row.second+"#{index}"] = flight
      end
    end
    flights
  end

  def row_count(row)
    row.each_with_index do |value,index|
      return (index-1) if value.strip == '-- Select Attribute  --'
    end
  end

  def clean_row(row,row_count)
    row[0..row_count]
  end
 
  private

  # Returns only rows with data - as an array of hashes
  def set_all_rows_as_hashes
    rows = [];
    (csv.first_row..csv.last_row).each do |i|
      rows.push Hash[header.zip(csv.row(i)[0..last_index])]
    end
    rows
  end

  def to_snake_case(string)
    string.gsub(":","").strip.downcase.gsub(" ","_")
  end


  def flight_ad_tag_atts(flight_start_row)
    row_headers = (flight_start_row + 3)
    
    # flight={}
    #     flight['flight'] = all_rows[index].second
    #     flight['adserver_cost'] = all_rows[index+1].second

    #     header = index+3
        
    #     #  until all_rows[header].nil?
    #     #     flights.push all_rows[header]
    #     #     header += 1
    #     #  end
    #     flights.push flight

    @all_rows[row_headers].each_with_index do |headers|
    end
  end


end