class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @user = User.new(account_params)
    begin
      if @user.save
        session[:user_id] = @user.email
        redirect_to root_path
      else
        render :new
      end
    rescue 
      redirect_to root_path, notice: "Email Already Exists."
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(account_params)
        format.html { redirect_to root_path, notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def account_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :points, :admin)
      end


end