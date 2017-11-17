class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def current_company
    if current_user.company_users != []
      session[:company_id] ||= current_user.company_users.first.company.id
      @current_company ||= Company.find(session[:company_id])
    else
      @current_company = nil
    end
  end

  def generate_notice(users_id:, companies_id:, body:, associate_type:, associate_id:)
    notice = Notice.create(body: body, associate_type: associate_type, read: 0)
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
    todo = Todo.create(body: body, associate_type: associate_type, done: 0)
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
      if company_user.user.employment_status == false
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

  def attendance_status(user:)
    if last_attendance = user.attendances.last
      last_attendance_status = [last_attendance.work_started_at, last_attendance.work_stopped_at, last_attendance.break_started_at, last_attendance.break_stopped_at]
      attendance_status = "am_work" if last_attendance_status[1] == nil && last_attendance_status[2] == nil && last_attendance_status[3] == nil
      attendance_status = "break" if last_attendance_status[1] == nil && last_attendance_status[2] != nil && last_attendance_status[3] == nil
      attendance_status = "pm_work" if last_attendance_status[1] == nil && last_attendance_status[2] != nil && last_attendance_status[3] != nil
      attendance_status = "not_work" if last_attendance_status[1] != nil
    else
      attendance_status = "never_work"
    end
    attendance_status
  end

  def update_todo(type:, associate_id:)
    if type == "report"
      if report_todo = ReportTodo.find_by(report_id:associate_id)
        todo = Todo.find(report_todo.todo_id)
        todo.update(done:1)
      end
    elsif type == "goal"
      if goal_todo = GoalTodo.find_by(goal_id:associate_id)
        todo = Todo.find(goal_todo.todo_id)
        todo.update(done:1)
      end
    end
  end

  def stamps
    stamps = Stamp.all
  end

  def search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end

  # private
  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #       user_params.permit(:name, :email, :password, :university, :grade, :department, :position, :gender, :birthday, :profile_photo_url, :employment_status)
  #     end
  #   end
end
