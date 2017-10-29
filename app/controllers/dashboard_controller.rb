class DashboardController < ApplicationController
  def index
    if current_company != nil
      @user = current_company.users.find(current_user.id)
      #社員用ダッシュボード
      @users = current_company.users.all
      @schedules_for_staff = current_company.schedules.all.limit(5).reverse_order
      @searched_users = User.all.page(params[:page]).per(10).search(params[:search])
      @notice_users = @user.notice_users.limit(5).reverse_order

      #インターン生用ダッシュボード
      if @user.attendances != []
        if @user.attendances.last.work_started_at != nil && @user.attendances.last.work_stopped_at == nil
          if @user.attendances.last.break_started_at == nil && @user.attendances.last.break_stopped_at == nil
            #出勤しているが、休憩はしていない場合
            @break_time = 0
            @attendance_time = Time.now.to_time.to_i - @user.attendances.last.work_started_at.to_time.to_i
          elsif @user.attendances.last.break_started_at != nil && @user.attendances.last.break_stopped_at == nil
            #休憩中の場合
            @break_time = Time.now.to_time.to_i - @user.attendances.last.break_started_at.to_time.to_i
            @attendance_time = Time.now.to_time.to_i - @user.attendances.last.work_started_at.to_time.to_i - @break_time
          elsif @user.attendances.last.break_started_at != nil && @user.attendances.last.break_stopped_at != nil
            #出勤していて休憩もしている場合
            @break_time =  @user.attendances.last.break_stopped_at.to_time.to_i - @user.attendances.last.break_started_at.to_time.to_i
            @attendance_time = Time.now.to_time.to_i - @user.attendances.last.work_started_at.to_time.to_i - @break_time
          end
        else
          #退勤中の場合
          @last_attendance_time = @user.attendances.last.work_stopped_at.to_time.to_i - @user.attendances.last.work_started_at.to_time.to_i
        end
      else
        #初回出社前の場合
      end

      #その日の出勤シフトについて
      today_work_schedule = current_company.schedules.where(user_id: current_user.id, work_started_at: Time.now.beginning_of_day...Time.now.end_of_day).first
      if today_work_schedule != nil
        #その日の出勤シフトがある場合
        @today_work_schedule = ""
        @today_work_schedule += today_work_schedule.work_started_at.strftime("%m月%d日 %-H時%M分")
        @today_work_schedule += " ~ "
        @today_work_schedule += today_work_schedule.work_ended_at.strftime("%-H時%M分")
      else
        #その日の出勤シフトがない場合
        @today_work_schedule = "\"登録なし\""
      end

      #その日の翌日以降の出勤シフトについて
      next_work_schedule = current_company.schedules.where(user_id: current_user.id, work_started_at: Time.now.to_time..Float::INFINITY).order(:work_started_at).first
      if next_work_schedule != nil
        #次回以降の出勤シフトがある場合
        @next_work_schedule = next_work_schedule.work_started_at.strftime("%m月%d日 %-H時%M分")
        @next_work_schedule += " ~ "
        @next_work_schedule += next_work_schedule.work_ended_at.strftime("%-H時%M分")
      else
        #次回以降の出勤シフトがない場合
        @next_work_schedule = "\"登録なし\""
      end

      @schedules_for_intern = current_company.schedules.where(user_id:current_user.id).limit(5).reverse_order
      @schedule = Schedule.new
    else
    end
  end

  def set_current_company
    session[:company_id] = params[:company_id]
    redirect_back(fallback_location: root_path)
  end

end
