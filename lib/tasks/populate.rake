namespace :populate do

  desc "Populate the list of Barclays Bike stations"

  task stations: :environment do

    require 'net/http'
    require 'rubygems'
    require 'xmlsimple'

    puts "Populating Barclays Bike Cycle Hire Stations"

    url = "http://www.tfl.gov.uk/tfl/syndication/feeds/cycle-hire/livecyclehireupdates.xml"
    
    puts "Data URL: '#{url}'."

    xml_data = Net::HTTP.get_response(URI.parse(url)).body

    stations = XmlSimple.xml_in(xml_data)

    num_stations= stations['station'].size   #or $param.size
    puts "Fetched #{num_stations} stations."

    existing_stations = Station.all
    puts "Removing all #{existing_stations.length} existing stations..."
    existing_stations.delete_all

    puts "Inserting retrieved stations."

    stations['station'].each do |station|

      tfl_id = station["id"][0]

      # Workaround for some strange additional spaces in station names
      # eg. "River Street , Clerkenwell" => "River Street, Clerkenwell"
      name = station["name"][0].gsub(' ,', ',')

      puts sprintf("ID %3d : %s", tfl_id, name)

      @s = Station.new(
        :tfl_id => tfl_id,
        :name => name,
        :lat => station["lat"][0],
        :long => station["long"][0],
        :num_docks => station["nbDocks"][0]
      )
      @s.save

      # Small pause in order to avoid problems hammering database (eg. with SQLite)
      sleep(0.05)

    end

    puts "Stations successfully populated."

  end

end
