class Xls
  def self.to_csv(file_path)
    Roo::Spreadsheet.open(file_path).to_csv
  end
end
