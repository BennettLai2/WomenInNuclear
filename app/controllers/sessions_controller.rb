class SessionsController < ApplicationController
    def login
        @users = User.all

        if params[:search_by_first_name] && params[:search_by_first_name] != ""
        @users = User.where('first_name LIKE ?', "%#{params[:search_by_first_name]}%")
        end 

      if params[:search_by_last_name] && params[:search_by_last_name] != ""
        @users = User.where('last_name LIKE ?', "%#{params[:search_by_last_name]}%").and(User.where('first_name LIKE ?', "%#{params[:search_by_first_name]}%"))
      end
    end

    def meeting
        @user = User.find(params[:session_id])
        @event = Event.with_valid_time(params[:event_id]);
    end

    def resetpoints
    end
  
    def resetpointsconfirm
      @email_confirmation = params[:confirmation_id]
      @real_admin_email = User.find(params[:session_id]).email
      if @email_confirmation == @real_admin_email
        User.update_all(points: 0)
        redirect_to root_path notice: "Operation Succeeded: Points have been reset to 0"
      else
        redirect_to root_path, notice: "Operation Failed: Email is incorrect, points have not been changed"
      end
    end

    def leaderboard
        @users = User.all.order('points DESC')
      end
end