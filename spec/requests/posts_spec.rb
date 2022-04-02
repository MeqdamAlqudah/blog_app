require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET index' do
    it 'redirects posts to index page' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('This is posts index page')
    end

    it 'render to show page' do
      get '/users/1/posts/2'
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('This posts show page')
    end
  end
end
