module ApplicationHelper
  def current_company
    if current_user.company_users != []
      session[:company_id] ||= current_user.company_users.first.company.id
      @current_company ||= Company.find(session[:company_id])
    else
      @current_company = nil
    end
  end

  def notice_path(notice)
    if notice.associate_type == "report"
      path = notice.report_notices.first.report
    elsif notice.associate_type == "task"
      path = notice.task_notices.first.task
    elsif notice.associate_type == "goal"
      path = notice.goal_notices.first.goal
    end
    path
  end

  def todo_path(todo)
    if todo.associate_type == "report"
      path = todo.report_todos.first.report
    elsif todo.associate_type == "goal"
      path = todo.goal_todos.first.goal
    end
    path
  end

  def stamp_pressed(type: ,id:)
    if type == "report"
      stamp_pressed = ReportStamp.find_by(report_id: id, user_id: current_user.id)
    elsif type == "goal"
      stamp_pressed = GoalStamp.find_by(goal_id: id, user_id: current_user.id)
    end
    stamp_pressed
  end

  def same_stamp_pressed(type: ,id: ,stamp_id:)
    if type == "report"
      stamp_pressed = ReportStamp.find_by(report_id: id, user_id: current_user.id, id: stamp_id)
    elsif type == "goal"
      stamp_pressed = GoalStamp.find_by(goal_id: id, user_id: current_user.id, id: stamp_id)
    end
    stamp_pressed
  end

  def attendance_status
    if last_attendance = @user.attendances.last
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
end
