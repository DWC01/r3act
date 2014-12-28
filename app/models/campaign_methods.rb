module CampaignMethods

  def save_file_as_ad_tags(file_path)
    CsvSchedule.new(file_path)
  end

end

class Xls

  def self.to_csv(file_path)
    Roo::Spreadsheet.open(file_path).to_csv
  end

  def junk
    # csv = Xls.to_csv(file_path)

    # puts""
    # puts""
    # puts"Puts TO_CSV FROM SCHEDULE 2"
    # puts csv.inspect  
    # puts""
    # puts""  

    # file = Spreadsheet::Workbook.new
    # sheet = file.create_worksheet :name => "csv data"

    # csv.each_with_index do |row, index|
    #   sheet.row(index+1).push row
    # end

    # if @campaign.update(ad_tags_file: sheet)
    #   puts "THE CAMAPGIN SAVVVED!!!" 
    # end
  end

end
