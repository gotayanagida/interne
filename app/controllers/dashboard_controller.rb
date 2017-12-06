class DashboardController < ApplicationController
  def index
    redirect_to update_user_after_login_path if session[:after_sign_up] == true
    session[:mypage] = false

    if current_company != nil
      @schedules = current_company.schedules.all
      @tasks_not_desided_day = []
      tasks = current_company.tasks
      tasks.each do |task|
        if task.schedules == []
          @tasks_not_desided_day.append(task)
        end
      end


      @reports = current_company.reports.limit(5).reverse_order
      users = current_company.users.where(employment_status:1)
      @users = users.page(params[:page]).per(10)

      if current_user.employment_status == false
        #社員用トップ
        @user = current_company.users.find(current_user.id)
        @active_attendances = Attendance.where(company_id: current_company, work_stopped_at: nil)
        range = Time.now.next_day.beginning_of_day...Float::INFINITY
        @schedules_for_staff = current_company.schedules.where(work_started_at: range).order(:work_started_at).limit(5)
        @searched_users = User.all.page(params[:page]).per(10).search(params[:search])
        @todo_users = @user.todo_users.reverse_order
      else
        @user = current_company.users.find(current_user.id)
        #4 buttons
        if @user.attendances != []
          now_time = Time.now.to_time.to_i
          work_started_time = @user.attendances.last.work_started_at.to_i
          work_stopped_time = @user.attendances.last.work_stopped_at.to_i
          break_started_time = @user.attendances.last.break_started_at.to_i
          break_stopped_time = @user.attendances.last.break_stopped_at.to_i
          @break_time = 0.to_i if attendance_status(user:@user) == "am_work"
          @break_time = now_time - break_started_time if attendance_status(user:@user) == "break"
          @break_time = break_stopped_time - break_started_time if attendance_status(user:@user) == "pm_work" || attendance_status(user:@user) == "not_work"
          @attendance_time = now_time - work_started_time - @break_time
          @last_attendance_time = work_stopped_time - work_started_time - @break_time.to_i if attendance_status(user:@user) == "not_work"
        end

        from_now_on = Time.now.beginning_of_day...Float::INFINITY
        @future_schedules = current_user.schedules.where(work_started_at:from_now_on, company_id:current_company.id)
        @user_tasks_not_desided_day = []
        user_tasks = current_user.tasks
        user_tasks.each do |user_task|
          if user_task.schedules == []
            @user_tasks_not_desided_day.append(user_task)
          end
        end
        range = Time.now.next_day.beginning_of_day...Float::INFINITY
        @schedules_for_intern = current_company.schedules.where(work_started_at: range, user_id:current_user.id).order(:work_started_at).limit(5)

        @schedule = Schedule.new
      end
    end
  end

  def set_current_company
    session[:company_id] = params[:company_id]
    redirect_back(fallback_location: root_path)
  end

end
