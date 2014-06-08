class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
  end

  # GET /stations/populate
  def populate
    # http://www.tfl.gov.uk/tfl/syndication/feeds/cycle-hire/livecyclehireupdates.xml

    require 'net/http'
    require 'rubygems'
    require 'xmlsimple'

    url = 'http://www.tfl.gov.uk/tfl/syndication/feeds/cycle-hire/livecyclehireupdates.xml'
    xml_data = Net::HTTP.get_response(URI.parse(url)).body

    stations = XmlSimple.xml_in(xml_data)

    stations['station'].each do |station|

      tfl_id = station["id"]
      name = station["name"]

      puts "Processing ID = #{tfl_id}. Name = #{name}..."

      @s = Station.new(
        :tfl_id => station["id"][0],
        :name => station["name"][0],
        :lat => station["lat"][0],
        :long => station["long"][0],
        :num_docks => station["nbDocks"][0]
      )
      @s.save
      sleep(0.1)

    end

    # doc = Nokogiri::XML(open('http://www.tfl.gov.uk/tfl/syndication/feeds/cycle-hire/livecyclehireupdates.xml'))

    #puts doc

    # Search for nodes by xpath
    # doc.xpath('//stations/station').each do |station|
    #   puts station[0].to_s

    # end

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Stations successfully populated.' }
    end

  end

  # GET /stations/1
  # GET /stations/1.json
  def show
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url, notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:lat, :long, :name, :num_docks, :tfl_id)
    end
end
