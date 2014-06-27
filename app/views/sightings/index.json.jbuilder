json.array!(@sightings) do |sighting|
  json.extract! sighting, :id, :lat, :long, :time
  json.url sighting_url(sighting, format: :json)
end
