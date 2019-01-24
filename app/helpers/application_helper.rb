module ApplicationHelper
  def map_url(obj)
    "https://api.mapbox.com/styles/v1/mapbox/outdoors-v10/static/#{obj.long},#{obj.lat},14,0,0/300x200?access_token=#{Rails.application.credentials.mapbox[:access_token]}"
  end
end
