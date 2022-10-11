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
    @event = Event.with_valid_time(params[:event_id]);
    # Got this to work, but there is a bug:
    # A user can continuously click on attend meeting with the same code and keep updating their points -> Implement future
    # ticket to fix this?
  end

  def resetpoints
  end

  def resetpointsconfirm
    @email_confirmation = params[:confirmation_id]
    @real_admin_email = Account.find(params[:account_id]).email
    if @email_confirmation == @real_admin_email
      Account.update_all(points: 0)
      redirect_to accounts_url, notice: "Operation Succeeded: Points have been reset to 0"
    else
      redirect_to accounts_url, notice: "Operation Failed: Email is incorrect, points have not been changed"
    end
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    begin
      if @account.save
        session[:user_id] = @account.email
        redirect_to root_path
      else
        render :new
      end
    rescue 
      redirect_to root_path, notice: "Email Already Exists."
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
end