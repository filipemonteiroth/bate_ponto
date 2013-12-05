class WorkPointsController < ApplicationController
  before_action :set_work_point, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /work_points
  # GET /work_points.json
  def index
    @work_points = WorkPoint.all
  end

  # GET /work_points/1
  # GET /work_points/1.json
  def show
  end

  # GET /work_points/new
  def new
    @work_point = WorkPoint.new
  end

  # GET /work_points/1/edit
  def edit
  end

  # POST /work_points
  # POST /work_points.json
  def create
    @work_point = WorkPoint.new(work_point_params)
    @work_point.user_id = current_user.id

    respond_to do |format|
      if @work_point.save
        format.html { redirect_to @work_point, notice: 'Work point was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_point }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_points/1
  # PATCH/PUT /work_points/1.json
  def update
    respond_to do |format|
      if @work_point.update(work_point_params)
        format.html { redirect_to @work_point, notice: 'Work point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_points/1
  # DELETE /work_points/1.json
  def destroy
    @work_point.destroy
    respond_to do |format|
      format.html { redirect_to work_points_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_point
      @work_point = WorkPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_point_params
      params.require(:work_point).permit(:entrada, :almoco, :volta_almoco, :saida)
    end
end
