json.extract! event, :id, :start, :end, :points, :url, :created_at, :updated_at
json.url event_url(event, format: :json)
