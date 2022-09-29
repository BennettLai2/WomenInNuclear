class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # GET /accounts/1/meeting
  def meeting
    @account = Account.find(params[:account_id])
    # Got this to work, but there is a bug:
    # A user can continuously click on attend meeting with the same code and keep updating their points -> Implement future
    # ticket to fix this?
    @event = Event.where(meeting_id: params[:event_id]).where("start_time <= :current_time AND end_time >= :current_time", {current_time: Time.now}).take
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    if @account.save
      session[:user_id] = @account.email
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:first_name, :last_name, :email, :password, :points, :admin)
    end

    # def event_id_params
    #   params.require(:event).permit(:event_id)
    # end
end