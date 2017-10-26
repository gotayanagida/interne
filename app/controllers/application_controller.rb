class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def current_company
    session[:company_id] ||= current_user.company_users.first.company.id
    @current_company ||= Company.find(session[:company_id])
  end
end
