json.extract! catalog, :id, :title, :location, :phone_number, :time_monday, :time_tuesday, :time_wednesday, :time_thursday, :time_friday, :time_saturday, :time_sunday, :description, :photos, :has_free_wifi, :address, :created_at, :updated_at
json.url catalog_url(catalog, format: :json)
