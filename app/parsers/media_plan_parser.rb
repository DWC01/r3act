class MediaPlanParser
  attr_reader :csv, :all_rows

  def initialize(schedule_file_path)
    @csv = Roo::Spreadsheet.open(schedule_file_path)
    set_all_rows(csv)
  end

  # Returns two dimensional array, only rows with data
  def set_all_rows(csv)
    @all_rows=[]
    (csv.first_row..csv.last_row).map {|r| @all_rows.push csv.row(r)}
  end
end