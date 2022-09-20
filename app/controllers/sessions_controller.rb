class SessionsController < ApplicationController

    def create
        @account = Account.find_by(email: params[:email])
        if !!@account && @account.authenticate(params[:password])
            session[:user_id] = @account.email
            redirect_to accounts_path
        else 
            flash[:error] = "Error: Wrong username or password. "
            
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = ""
        redirect_to root_path
    end
end