class SessionsController < ApplicationController
    def login
        @users = User.all
    end
    def meeting
        @user = User.find(params[:session_id])
        # @user = current_user
        # Update once we merge Justin's code -> Change the meeting_name to meeting_id
        # Got this to work, but there is a bug:
        # A user can continuously click on attend meeting with the same code and keep updating their points -> Implement future
        # ticket to fix this?
        @event = Event.where(meeting_name: params[:event_id]).where("start_time <= :current_time AND end_time >= :current_time", {current_time: Time.now}).take
    end
end