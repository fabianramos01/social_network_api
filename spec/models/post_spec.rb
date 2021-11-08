require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation test' do
    it 'check when title not exist' do
      post = Post.new(content: 'Post de prueba del contenido', user_email: 'test@test.com').save
      expect(post).to eq(false)
    end

    it 'check when content not exist' do
      post = Post.new(title: 'Titulo de prueba', user_email: 'test@test.com').save
      expect(post).to eq(false)
    end

    it 'check when user_email not exist' do
      post = Post.new(content: 'Post de prueba del contenido', title: 'Titulo de prueba').save
      expect(post).to eq(false)
    end

    it 'check when user_email is not valid' do
      post = Post.new(content: 'Post de prueba del contenido', title: 'Titulo de prueba', user_email: 'test.com').save
      expect(post).to eq(false)
    end

    it 'check save sucessfully' do
      post = Post.new(content: 'Post de prueba del contenido', title: 'Titulo de prueba', user_email: 'test@test.com').save
      expect(post).to eq(true)
    end
  end

  context 'scope tests' do
    before(:each) do
      Post.new(content: 'Post de prueba del contenido', title: 'Titulo de prueba', user_email: 'test@test.com').save
      Post.new(content: 'Post de prueba del contenido', title: 'Titulo de prueba', user_email: 'test@test.com').save
      Post.new(content: 'Post de prueba del contenido', title: 'Titulo de prueba', user_email: 'test@test.com').save
      Post.new(content: 'Post de prueba del contenido', title: 'Titulo de prueba', user_email: 'test@test.com').save
    end
  end
end
