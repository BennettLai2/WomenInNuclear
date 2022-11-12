class MilestonesController < ApplicationController
  before_action :set_milestone, only: %i[ show edit update destroy ]

  # GET /milestones or /milestones.json
  def index
    @milestones = Milestone.all
  end

  # GET /milestones/1 or /milestones/1.json
  def show
  end

  # GET /milestones/new
  def new
    @milestone = Milestone.new
  end

  # GET /milestones/1/edit
  def edit
  end

  # POST /milestones or /milestones.json
  def create
    @milestone = Milestone.new(milestone_params)

    respond_to do |format|
      if @milestone.save
        User.where("points >= ?", milestone_params['points']).find_each do |user|
          PersonMilestoneMap.where(person_id: user.id, milestone_id: @milestone.id).first_or_create
        end
        format.html { redirect_to milestone_url(@milestone)}
        flash[:alert] = "Milestone was successfully created."
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestones/1 or /milestones/1.json
  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        User.where("points >= ?", milestone_params['points']).find_each do |account|
          PersonMilestoneMap.where(person_id: account.id, milestone_id: @milestone.id).first_or_create
        end
        User.where("points < ?", milestone_params['points']).find_each do |account|
          PersonMilestoneMap.where(person_id: account.id, milestone_id: @milestone.id).destroy_all
        end
        flash[:alert] = "Milestone was successfully updated."
        format.html { redirect_to milestone_url(@milestone)}
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1 or /milestones/1.json
  def destroy
    PersonMilestoneMap.where(milestone_id: @milestone.id).destroy_all
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to milestones_url}
      flash[:alert] = "Milestone was successfully destroyed." 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def milestone_params
      params.require(:milestone).permit(:name, :points, :message)
    end
end
