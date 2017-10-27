require 'csv'
require 'nkf'

csv_str = CSV.generate do |csv|
  csv_column_names = %w(Firstname Lastname Email)
  csv << csv_column_names
  @attendances_for_csv.each do |attendance|
    csv_column_values = [
      attendance.user.name,
      attendance.work_started_at,
      attendance.work_stopped_at
    ]
    csv << csv_column_values
  end
end

NKF::nkf('--sjis -Lw', csv_str)
