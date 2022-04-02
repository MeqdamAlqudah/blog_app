require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'redirects posts to index page' do
      get '/users'
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('This index users page')
    end

    it 'render to show page' do
      get '/users/1'
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('This is show users page')
    end
  end
end
