namespace :mail do
  desc "asynchronous mailing process"
  task send_day_before_to_staffs: :environment do
    staffs = User.where(employment_status:0)
    staffs.each do |staff|
      range = Time.now.next_day.beginning_of_day..Time.now.next_day.end_of_day
      schedules = staff.company_users.first.company.schedules.where(work_started_at: range)
      if schedules != []
        NoticeMailer.send_day_before_to_staff(schedules, staff).deliver
      end
    end
  end

  task send_day_before_to_interns: :environment do
    interns = User.where(employment_status:1)
    interns.each do |intern|
      range = Time.now.next_day.beginning_of_day..Time.now.next_day.end_of_day
      schedules = intern.schedules.where(work_started_at: range)
      if schedules != []
        NoticeMailer.send_day_before_to_intern(schedules, intern).deliver
      end
    end
  end

  task seven_days_nothing_schedule: :environment do
    interns = User.where(employment_status:1)
    interns.each do |intern|
      range = (Date.today + 7).beginning_of_day..Float::INFINITY
      schedules = intern.schedules.where(work_started_at: range)
      if schedules == []
        NoticeMailer.seven_days_nothing_schedule(intern).deliver
      end
    end
  end
end
