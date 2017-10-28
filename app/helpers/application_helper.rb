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
end
