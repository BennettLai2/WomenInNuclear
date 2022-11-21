
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
    PersonMilestoneMap.where(person_id: @user.id).destory_all
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
        Milestone.where("points <= ?", account_params['points']).find_each do |milestone|
          PersonMilestoneMap.where(person_id: @user.id, milestone_id: milestone.id).first_or_create
        end
        Milestone.where("points > ?", account_params['points']).find_each do |milestone|
          PersonMilestoneMap.find_by(person_id: @user.id, milestone_id: milestone.id).try(:destroy)
        end

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
    @user = User.find(params[:id])
    PersonMilestoneMap.where(person_id: @user.id).destroy_all
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_admin
    @user = User.find(params[:id])
    @user.update(admin: !@user.admin)
    respond_to do |format|
      format.html { redirect_to root_path, notice: (@user.admin)? "Made user admin": "Demoted admin" }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def account_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :points, :admin)
      end


end
