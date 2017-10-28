class StampsController < ApplicationController
  before_action :set_stamp, only: [:show, :edit, :update, :destroy]

  # GET /stamps
  # GET /stamps.json
  def index
    @stamps = Stamp.all
  end

  # GET /stamps/1
  # GET /stamps/1.json
  def show
  end

  # GET /stamps/new
  def new
    @stamp = Stamp.new
  end

  # GET /stamps/1/edit
  def edit
  end

  # POST /stamps
  # POST /stamps.json
  def create
    @stamp = Stamp.new(stamp_params)

    respond_to do |format|
      if @stamp.save
        format.html { redirect_to @stamp, notice: 'Stamp was successfully created.' }
        format.json { render :show, status: :created, location: @stamp }
      else
        format.html { render :new }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stamps/1
  # PATCH/PUT /stamps/1.json
  def update
    respond_to do |format|
      if @stamp.update(stamp_params)
        format.html { redirect_to @stamp, notice: 'Stamp was successfully updated.' }
        format.json { render :show, status: :ok, location: @stamp }
      else
        format.html { render :edit }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stamps/1
  # DELETE /stamps/1.json
  def destroy
    @stamp.destroy
    respond_to do |format|
      format.html { redirect_to stamps_url, notice: 'Stamp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def press_stamp
    if params[:associate_type] == "report"
      ReportStamp.create(report_id:params[:associate_id] ,stamp_id:params[:stamp_id] ,user_id:current_user.id)
    elsif params[:associate_type] == "goal"
      GoalStamp.create(goal_id:params[:associate_id] ,stamp_id:params[:stamp_id] ,user_id:current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  def remove_stamp
    if params[:associate_type] == "report"
      ReportStamp.find_by(report_id:params[:associate_id], user_id:current_user.id).destroy
    elsif params[:associate_type] == "goal"
      GoalStamp.find_by(goal_id:params[:associate_id], user_id:current_user.id).destroy
    end
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stamp
      @stamp = Stamp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stamp_params
      params.require(:stamp).permit(:url)
    end
end
