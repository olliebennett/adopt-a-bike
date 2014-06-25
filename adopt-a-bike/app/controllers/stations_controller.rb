class StationsController < ApplicationController
  before_action :set_station, only: [:show]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all.paginate(:page => params[:page]).order('tfl_id ASC').per_page(100)
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find_by(tfl_id: params[:tfl_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:lat, :long, :name, :num_docks, :tfl_id)
    end
end
