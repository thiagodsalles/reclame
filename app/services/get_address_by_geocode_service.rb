class GetAddressByGeocodeService < ApplicationService

  def initialize(geocode)
    @geocode = geocode
  end

  def call
    begin
      data = Geocoder.search(@geocode).first.data
      {
        country: data['address']['country'],
        state: data['address']['state'],
        city: data['address']['city'],
        suburb: data['address']['suburb'],
        latitude: data['lat'],
        longitude: data['lon']
      }
    rescue
      nil
    end
  end
end
