class GetAddressByGeocodeService < ApplicationService

  def initialize(geocode)
    @geocode = geocode
  end

  def call
    data = Geocoder.search(@geocode).first.data
    {
      country: data['address']['country'],
      state: data['address']['state'],
      city: data['address']['city'],
      latitude: data['lat'],
      longitude: data['lon']
    }
  end
end