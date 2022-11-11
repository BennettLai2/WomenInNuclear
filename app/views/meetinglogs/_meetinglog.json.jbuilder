json.extract! meetinglog, :id, :user_id, :meeting_id, :created_at, :updated_at
json.url meetinglog_url(meetinglog, format: :json)
