class PersonMilestoneMapsController < ApplicationController
  before_action :set_person_milestone_map, only: %i[ show edit update destroy ]

  # GET /person_milestone_maps or /person_milestone_maps.json
  def index
    @person_milestone_maps = PersonMilestoneMap.all
  end

  # GET /person_milestone_maps/1 or /person_milestone_maps/1.json
  def show
  end

  # GET /person_milestone_maps/new
  def new
    @person_milestone_map = PersonMilestoneMap.new
  end

  # GET /person_milestone_maps/1/edit
  def edit
  end

  def my_milestones
    @milestones = Milestone.joins("INNER JOIN Person_Milestone_Maps ON person_milestone_maps.milestone_id = milestones.id WHERE person_milestone_maps.person_id = #{current_user.id}")
  end

  # POST /person_milestone_maps or /person_milestone_maps.json
  def create
    @person_milestone_map = PersonMilestoneMap.new(person_milestone_map_params)

    respond_to do |format|
      if @person_milestone_map.save
        format.html { redirect_to person_milestone_map_url(@person_milestone_map), notice: "Person milestone map was successfully created." }
        format.json { render :show, status: :created, location: @person_milestone_map }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person_milestone_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_milestone_maps/1 or /person_milestone_maps/1.json
  def update
    respond_to do |format|
      if @person_milestone_map.update(person_milestone_map_params)
        format.html { redirect_to person_milestone_map_url(@person_milestone_map), notice: "Person milestone map was successfully updated." }
        format.json { render :show, status: :ok, location: @person_milestone_map }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person_milestone_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_milestone_maps/1 or /person_milestone_maps/1.json
  def destroy
    @person_milestone_map.destroy

    respond_to do |format|
      format.html { redirect_to person_milestone_maps_url, notice: "Person milestone map was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_milestone_map
      @person_milestone_map = PersonMilestoneMap.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_milestone_map_params
      params.require(:person_milestone_map).permit(:person_id, :milestone_id)
    end
end
