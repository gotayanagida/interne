class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def set_company()
    if company_user != nil
      current_company = company_user
      binding.pry
    end
  end

end
