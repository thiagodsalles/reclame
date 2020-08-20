require 'rails_helper'

RSpec.describe 'Complaints', type: :request do
  let!(:complaint) { create :complaint }
  let!(:complaint_two) do
    create :complaint, title: 'mytitle', company: 'company2', country: 'country2', state: 'state2',
                       city: 'city2', latitude: 11, longitude: 11, suburb: 'suburb2'
  end

  describe 'GET /complaints' do
    context 'without params' do
      it 'has status code 200' do
        get api_v1_complaints_path
        expect(response).to have_http_status(200)
      end

      it 'response body' do
        get api_v1_complaints_path
        expect(JSON.parse(response.body).first.except('created_at', 'updated_at'))
          .to eq(complaint.as_json.except('created_at', 'updated_at'))
      end
    end

    context 'with filters params' do
      context 'title' do
        let(:params) { { title: 'title' } }

        it 'has status code 200' do
          get api_v1_complaints_path, params: params
          expect(response).to have_http_status(200)
        end

        it 'response body' do
          get api_v1_complaints_path, params: params
          expect(JSON.parse(response.body).first.except('created_at', 'updated_at'))
            .to eq(complaint.as_json.except('created_at', 'updated_at'))
        end
      end

      context 'company' do
        let(:params) { { company: 'company' } }

        it 'has status code 200' do
          get api_v1_complaints_path, params: params
          expect(response).to have_http_status(200)
        end

        it 'response body' do
          get api_v1_complaints_path, params: params
          expect(JSON.parse(response.body).first.except('created_at', 'updated_at'))
              .to eq(complaint.as_json.except('created_at', 'updated_at'))
        end
      end

      context 'country' do
        let(:params) { { country: 'country' } }

        it 'has status code 200' do
          get api_v1_complaints_path, params: params
          expect(response).to have_http_status(200)
        end

        it 'response body' do
          get api_v1_complaints_path, params: params
          expect(JSON.parse(response.body).first.except('created_at', 'updated_at'))
              .to eq(complaint.as_json.except('created_at', 'updated_at'))
        end
      end

      context 'state' do
        let(:params) { { state: 'state' } }

        it 'has status code 200' do
          get api_v1_complaints_path, params: params
          expect(response).to have_http_status(200)
        end

        it 'response body' do
          get api_v1_complaints_path, params: params
          expect(JSON.parse(response.body).first.except('created_at', 'updated_at'))
              .to eq(complaint.as_json.except('created_at', 'updated_at'))
        end
      end

      context 'city' do
        let(:params) { { city: 'city' } }

        it 'has status code 200' do
          get api_v1_complaints_path, params: params
          expect(response).to have_http_status(200)
        end

        it 'response body' do
          get api_v1_complaints_path, params: params
          expect(JSON.parse(response.body).first.except('created_at', 'updated_at'))
              .to eq(complaint.as_json.except('created_at', 'updated_at'))
        end
      end

      context 'latitude' do
        let(:params) { { latitude: 10 } }

        it 'has status code 200' do
          get api_v1_complaints_path, params: params
          expect(response).to have_http_status(200)
        end

        it 'response body' do
          get api_v1_complaints_path, params: params
          expect(JSON.parse(response.body).first.except('created_at', 'updated_at'))
              .to eq(complaint.as_json.except('created_at', 'updated_at'))
        end
      end

      context 'longitude' do
        let(:params) { { longitude: 10 } }

        it 'has status code 200' do
          get api_v1_complaints_path, params: params
          expect(response).to have_http_status(200)
        end

        it 'response body' do
          get api_v1_complaints_path, params: params
          expect(JSON.parse(response.body).first.except('created_at', 'updated_at'))
              .to eq(complaint.as_json.except('created_at', 'updated_at'))
        end
      end

      context 'suburb' do
        let(:params) { { suburb: 'suburb' } }

        it 'has status code 200' do
          get api_v1_complaints_path, params: params
          expect(response).to have_http_status(200)
        end

        it 'response body' do
          get api_v1_complaints_path, params: params
          expect(JSON.parse(response.body).first.except('created_at', 'updated_at'))
              .to eq(complaint.as_json.except('created_at', 'updated_at'))
        end
      end
    end
  end

  describe 'GET /complaints/:id' do
    it 'has status code 200' do
      get "/api/v1/complaints/#{complaint.id}"
      expect(response).to have_http_status(200)
    end

    it 'response body' do
      get "/api/v1/complaints/#{complaint.id}"
      expect(JSON.parse(response.body).except('created_at', 'updated_at'))
        .to eq(complaint.as_json.except('created_at', 'updated_at'))
    end

    context 'when not found' do
      it 'has status code 404' do
        get "/api/v1/complaints/#{complaint.id + 2}"
        expect(response).to have_http_status(404)
      end
    end
  end


  describe 'POST /complaints' do
    let(:complaint) { attributes_for :complaint }

    it 'has status code 201' do
      post api_v1_complaints_path, params: { complaint: { **complaint, locale: [10, 10] } }
      expect(response).to have_http_status(201)
    end

    it 'response body' do
      post api_v1_complaints_path, params: { complaint: { **complaint, locale: [10, 10] } }
      expect(JSON.parse(response.body, symbolize_names: true).except(:id, :created_at, :updated_at))
          .to eq({title: 'title', description: 'description', company: 'company', country: 'Nigeria', state: 'Bauchi', city: 'Mun-Munsal', latitude: '10.01106025', longitude: '9.962352200691214', 'suburb': nil})
    end
  end


  describe 'PUT /complaints/:id' do
    it 'has status code 200' do
      put "/api/v1/complaints/#{complaint.id}", params: { complaint: { title: 'title2' } }
      expect(response).to have_http_status(200)
    end

    it 'returns updated complaint' do
      put "/api/v1/complaints/#{complaint.id}", params: { complaint: { title: 'title2' } }
      expect(JSON.parse(response.body)['title']).to eq('title2')
    end
  end

  describe 'DELETE /complaints/:id' do
    it 'has status code 200' do
      delete "/api/v1/complaints/#{complaint.id}"
      expect(response).to have_http_status(200)
    end

    it 'response body' do
      delete "/api/v1/complaints/#{complaint.id}"
      expect(JSON.parse(response.body).except('created_at', 'updated_at')).to eq(complaint.as_json.except('created_at', 'updated_at'))
    end
  end
end


