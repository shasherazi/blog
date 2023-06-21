require_relative '../rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET index' do
    before do
      get '/users'
    end

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    before do
      get '/users/1'
    end

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
