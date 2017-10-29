class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    goals = current_company.goals.all.reverse_order
    @goals_3 = goals.where(span:3)
    @goals_12 = goals.where(span:12)
    @stamps = Stamp.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end

    #お知らせ生成
    name = current_user.name
    title = params[:goal][:title]
    span = params[:goal][:span] = 3 ? "３ヶ月間" : "一年間"
    generate_notice(users_id:intern_and_staffs_id_arr, companies_id:companies_id_arr, body:"#{name}さんが#{span}の目標「#{title}」を作成しました", associate_type:"goal", associate_id: @goal.id)
    generate_todo(users_id:intern_and_staffs_id_arr, companies_id:companies_id_arr, body:"#{name}さんが#{span}の目標「#{title}」を作成しました。確認してスタンプを押しましょう。", associate_type:"report", associate_id: @goal.id)
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:user_id, :company_id, :span, :title, :detail)
    end
end
