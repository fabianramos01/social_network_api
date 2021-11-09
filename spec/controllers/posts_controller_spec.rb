require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before do
    @post = create(:post)
  end

  describe 'GET #index /api/posts' do
    it 'return correct count of posts' do
      get '/api/posts'
      parsed_body = JSON.parse(body)
      expect(parsed_body['count']).to eq(1)
    end
  end

  describe 'POST #create /api/posts' do
    it 'create post' do
      params = {
        post: {
          title: Faker::Lorem.sentence,
          content: Faker::Lorem.paragraph,
          user_email: Faker::Internet.email
        }
      }
      post '/api/posts', params: params
      parsed_body = JSON.parse(body)
      expect(response).to have_http_status(201)
      expect(parsed_body['likes_count']).to eq(0)
      expect(parsed_body['title']).to eq(params[:post][:title])
    end
  end

  describe 'POST #add_comment /api/posts/:id/comment' do
    it 'add comment' do
      params = {
        post: {
          title: Faker::Lorem.sentence,
          content: Faker::Lorem.paragraph,
          user_email: Faker::Internet.email
        }
      }
      post "/api/posts/#{@post.id}/comment", params: params
      parsed_body = JSON.parse(body)
      expect(response).to have_http_status(201)

      get "/api/posts/#{@post.id}"
      parsed_body = JSON.parse(body)
      expect(parsed_body['comments_count']).to eq(1)
    end
  end

  describe 'POST #set_post_reaction /api/posts/reaction' do
    it 'add like to post' do
      params = {
        "id": @post.id,
        "type": "like" 
      }
      post "/api/posts/reaction", params: params
      get "/api/posts/#{@post.id}"
      parsed_body = JSON.parse(body)
      expect(parsed_body['likes_count']).to eq(@post.likes_count + 1)
    end
    
    it 'add dislike to post' do
      params = {
        "id": @post.id,
        "type": "dislike" 
      }
      post "/api/posts/reaction", params: params
      get "/api/posts/#{@post.id}"
      parsed_body = JSON.parse(body)
      expect(parsed_body['dislikes_count']).to eq(@post.dislikes_count + 1)
    end
  end

  describe 'DELETE #remove_post_reaction /api/posts/reaction' do
    it 'add like to post' do
      params = {
        "id": @post.id,
        "type": "like" 
      }
      delete "/api/posts/reaction", params: params
      get "/api/posts/#{@post.id}"
      parsed_body = JSON.parse(body)
      expect(parsed_body['likes_count']).to eq(@post.likes_count - 1)
    end
    
    it 'remove dislike to post' do
      params = {
        "id": @post.id,
        "type": "dislike" 
      }
      delete "/api/posts/reaction", params: params
      get "/api/posts/#{@post.id}"
      parsed_body = JSON.parse(body)
      expect(parsed_body['dislikes_count']).to eq(@post.dislikes_count - 1)
    end
  end
end
