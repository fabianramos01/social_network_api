require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET #index /api/posts" do
    it 'return success response' do
      get '/api/posts'
      expect(response).to have_http_status(:ok)
    end
  end
end
