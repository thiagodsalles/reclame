require 'rails_helper'

RSpec.describe GetAddressByGeocodeService do
  describe 'call' do
    it 'get address from geocode' do
      expect(GetAddressByGeocodeService.call([-22, -43])).to eq({ city: 'Chiador',
                                                                  country: 'Brazil',
                                                                  latitude: '-22.002778',
                                                                  longitude: '-43.057222',
                                                                  state: 'Minas Gerais',
                                                                  suburb: nil })
    end
  end
end
