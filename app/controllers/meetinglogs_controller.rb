class MeetinglogsController < ApplicationController
  before_action :set_meetinglog, only: %i[ show edit update destroy ]

  # GET /meetinglogs or /meetinglogs.json
  def index
    @meetinglogs = Meetinglog.all
  end

  # GET /meetinglogs/1 or /meetinglogs/1.json
  def show
  end

  # GET /meetinglogs/new
  def new
    @meetinglog = Meetinglog.new
  end

  # GET /meetinglogs/1/edit
  def edit
  end

  # POST /meetinglogs or /meetinglogs.json
  def create
    @meetinglog = Meetinglog.new(meetinglog_params)

    respond_to do |format|
      if @meetinglog.save
        format.html { redirect_to meetinglog_url(@meetinglog), notice: "Meetinglog was successfully created." }
        format.json { render :show, status: :created, location: @meetinglog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meetinglog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetinglogs/1 or /meetinglogs/1.json
  def update
    respond_to do |format|
      if @meetinglog.update(meetinglog_params)
        format.html { redirect_to meetinglog_url(@meetinglog), notice: "Meetinglog was successfully updated." }
        format.json { render :show, status: :ok, location: @meetinglog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meetinglog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetinglogs/1 or /meetinglogs/1.json
  def destroy
    @meetinglog.destroy

    respond_to do |format|
      format.html { redirect_to meetinglogs_url, notice: "Meetinglog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetinglog
      @meetinglog = Meetinglog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meetinglog_params
      params.require(:meetinglog).permit(:user_id, :meeting_id)
    end
end
