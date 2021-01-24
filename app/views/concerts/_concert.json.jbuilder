json.extract! concert, :id, :place, :participants, :date, :duration, :group_id, :created_at, :updated_at
json.url concert_url(concert, format: :json)
