class SessionsController < ApplicationController
    def login
        @users = User.all
    end
end