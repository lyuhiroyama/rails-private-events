json.extract! event, :id, :event_name, :event_date, :creator_id, :created_at, :updated_at
json.url event_url(event, format: :json)
