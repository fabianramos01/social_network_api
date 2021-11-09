Rails.application.routes.draw do
  
  scope 'api/' do
    resources :posts, only: [:index, :show, :create]
    post '/posts/reaction', to: 'posts#set_post_reaction'
    delete '/posts/reaction', to: 'posts#remove_post_reaction'
    post '/posts/:id/comment', to: 'posts#add_comment'
  end
end
