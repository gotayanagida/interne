class DashboardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    if @user.attendances.last.work_started_at != nil && @user.attendances.last.work_stopped_at == nil#午前中
      if @user.attendances.last.break_started_at == nil && @user.attendances.last.break_stopped_at == nil#午前中
        @break_time = 0
        @attendance_time = Time.now.to_time.to_i - @user.attendances.last.work_started_at.to_time.to_i
      elsif @user.attendances.last.break_started_at != nil && @user.attendances.last.break_stopped_at == nil#休憩中
        @break_time = Time.now.to_time.to_i - @user.attendances.last.break_started_at.to_time.to_i
        @attendance_time = Time.now.to_time.to_i - @user.attendances.last.work_started_at.to_time.to_i - @break_time
      elsif @user.attendances.last.break_started_at != nil && @user.attendances.last.break_stopped_at != nil#午後
        @break_time =  @user.attendances.last.break_stopped_at.to_time.to_i - @user.attendances.last.break_started_at.to_time.to_i
        @attendance_time = Time.now.to_time.to_i - @user.attendances.last.work_started_at.to_time.to_i - @break_time
      end
    else
      @last_attendance_time = @user.attendances.last.work_stopped_at.to_time.to_i - @user.attendances.last.work_started_at.to_time.to_i
    end
  end
end
