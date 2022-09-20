class SessionsController < ApplicationController

    def create
        @account = Account.find_by(email: params[:email])
        if !!@account && @account.authenticate(params[:password])
            session[:user_id] = @account.email
            if !@account.admin
                redirect_to accounts_path
            else
                redirect_to login_path
            end
        else 
            flash[:error] = "Error: Wrong username or password. "
            
            redirect_to login_path
        end
    end
end