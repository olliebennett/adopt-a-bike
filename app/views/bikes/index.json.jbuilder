json.array!(@bikes) do |bike|
  json.extract! bike, :id, :name, :number
  json.url bike_url(bike, format: :json)
end
