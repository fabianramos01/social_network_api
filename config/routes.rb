Rails.application.routes.draw do
  
  scope 'api/' do
    resources :posts, only: [:index, :show, :create]
    patch '/posts/:id/like', to: 'posts#set_like'
    patch '/posts/:id/dislike', to: 'posts#set_dislike'
    post '/posts/:id/comment', to: 'posts#add_comment'
  end
end
