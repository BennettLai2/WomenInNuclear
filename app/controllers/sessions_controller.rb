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
	
	def meetingvalidation
		@user = current_user
		@event = Event.where(meeting_id: params[:event_id]).where("start_time <= :current_time AND end_time >= :current_time", {current_time: Time.now}).take
		@entry = Meetinglog.where(user_id: @user.id, meeting_id: params[:event_id]).exists?
		if(!@entry & @event)
			@meetinglog = Meetinglog.where(user_id: @user.id, meeting_id: params[:event_id]).first_or_create
			current_user.points = current_user.points + @event.points
			current_user.save
		end
	
	end

    def resetpoints
    end
  
    def resetpointsconfirm
      @email_confirmation = params[:confirmation_id]
      @real_admin_email = User.find(params[:session_id]).email
      if @email_confirmation == @real_admin_email
        User.update_all(points: 0)
        redirect_to root_path
        flash[:alert] = "Operation Succeeded: Points have been reset to 0"
        
      else
        redirect_to root_path
        flash[:alert] = "Operation Failed: Email is incorrect, points have not been changed"
      end
    end

    def leaderboard
        @users = User.all.order('points DESC')
      end

end