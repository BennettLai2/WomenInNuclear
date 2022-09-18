class SessionsController < ApplicationController

    def create
        @account = Account.find_by(email: params[:email])
        if !!@account && @account.authenticate(params[:password])
            session[:user_id] = @account.email
            redirect_to accounts_path
        else 
            message = "Wrong username or password. "
            redirect_to login_path, notice: message
        end
    end
end