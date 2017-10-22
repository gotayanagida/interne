class DashboardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @attendance_time = Time.now.to_time.to_i - @user.schedules.first.work_started_at.to_time.to_i
  end
end
