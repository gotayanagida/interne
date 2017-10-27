module ApplicationHelper
  def current_company
    if current_user.company_users != []
      session[:company_id] ||= current_user.company_users.first.company.id
      @current_company ||= Company.find(session[:company_id])
    else
      @current_company = nil
    end
  end
end
