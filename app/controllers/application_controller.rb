class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def current_company
    if current_user.company_users != []
      session[:company_id] ||= current_user.company_users.first.company.id
      @current_company ||= Company.find(session[:company_id])
    else
      @current_company = nil
    end
  end

  def generate_notice(users_id:, companies_id:, body:, associate_type:, associate_id:)
    notice = Notice.create(body: body, associate_type: associate_type)
    if associate_type == "report"
      report = Report.find(associate_id)
      report.notices << notice
    elsif associate_type == "task"
      task = Task.find(associate_id)
      task.notices << notice
    elsif associate_type == "goal"
      goal = Goal.find(associate_id)
      goal.notices << notice
    end
    users_id.each do |user_id|
      user = User.find(user_id)
      user.notices << notice
    end
    companies_id.each do |company_id|
      company = Company.find(company_id)
      company.notices << notice
    end
  end

  def generate_todo(users_id:, companies_id:, body:, associate_type:, associate_id:)
    todo = Todo.create(body: body, associate_type: associate_type)
    if associate_type == "report"
      report = Report.find(associate_id)
      report.todos << todo
    elsif associate_type == "goal"
      goal = Goal.find(associate_id)
      goal.todos << todo
    end
    users_id.each do |user_id|
      user = User.find(user_id)
      user.todos << todo
    end
    companies_id.each do |company_id|
      company = Company.find(company_id)
      company.todos << todo
    end
  end

  def intern_and_staffs_id_arr
    users_id = []
    users_id.append(current_user.id)
    current_company.company_users.each do |company_user|
      if company_user.user.employment_status == 0
        next if company_user.user.id == current_user.id
        users_id.append(company_user.user_id)
      end
    end
    users_id
  end

  def companies_id_arr
    companies_id = []
    companies_id.append(current_company.id)
  end

  def check_day_before
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
