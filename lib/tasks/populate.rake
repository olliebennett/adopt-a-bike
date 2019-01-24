namespace :stations do

  desc "Manipulate Barclays Bike stations"

  task populate: :environment do
    require 'net/http'

    puts "Populating Barclays Bike Cycle Hire Stations"

    url = 'https://api.tfl.gov.uk/BikePoint'
    
    puts "Data URL: '#{url}'."

    json_data = Net::HTTP.get_response(URI.parse(url)).body

    stations = JSON.parse(json_data)

    num_stations = stations.size
    puts "Fetched #{num_stations} stations."

    puts "Inserting retrieved stations."

    stations.each do |station_data|
      tfl_id = station_data['id'].gsub('BikePoints_', '').to_i

      # Workaround for some strange additional spaces in station names
      # eg. "River Street , Clerkenwell" => "River Street, Clerkenwell"
      common_name = station_data['commonName'].gsub(' ,', ',')

      puts sprintf("ID %3d : %s", tfl_id, common_name)

      other = {}
      station_data['additionalProperties'].each { |prop| other[prop['key']] = prop['value'] }

      Station.create!(
        tfl_id: tfl_id,
        name: common_name,
        lat: station_data['lat'],
        long: station_data['lon'],
        num_docks: other['NbDocks']
      )
    end

    puts "Stations successfully populated."
  end

  task clear: :environment do
    puts "Removing all Barclays Bike Cycle Hire Stations"

    existing_stations = Station.all
    puts "Removing all #{existing_stations.length} existing stations..."
    existing_stations.delete_all
  end
end
