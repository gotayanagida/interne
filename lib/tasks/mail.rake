namespace :mail do
  desc "asynchronous mailing process"
  task mail_delivery: :environment do
    staffs = User.where(employment_status:0)
    staffs.each do |staff|
      next_day_interns = []
      range = Time.now.next_day.beginning_of_day..Time.now.next_day.end_of_day
      schedules = staff.company_users.first.company.schedules.where(work_started_at: range)
      if schedules != []
        NoticeMailer.send_day_before(schedules, staff).deliver
      end
    end
  end
end
