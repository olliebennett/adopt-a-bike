json.array!(@stations) do |station|
  json.extract! station, :id, :lat, :long, :name, :num_docks
  json.url station_url(station, format: :json)
end
