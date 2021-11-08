class PostsController < ApplicationController
  before_action :set_post, only: [:show, :set_like, :set_dislike, :add_comment]

  def index
    pagy, posts = pagy(Post.all)
    render json: { data: posts, page: pagy.page, items: pagy.items, 
    last: pagy.last, pages: pagy.pages, prev: pagy.prev, next: pagy.next, count: pagy.count }
  end

  def show
    render json: @post, serializer: PostDetailSerializer
  end

  def create
    post = Post.new(post_params)
    if post.valid?
      post.save
      render json: post, status: :created, location: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def set_like
    @post.update(likes_count: @post.likes_count + 1)
    render json: @post, status: :ok, location: @post
  end

  def set_dislike
    @post.update(dislikes_count: @post.dislikes_count + 1)
    render json: @post, status: :ok, location: @post
  end

  def add_comment
    data = post_params
    data['post_id'] = @post.id
    puts data
    comment = Comment.new(data)
    if comment.valid?
      comment.save
      @post.update(comments_count: @post.comments_count + 1)
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :user_email)
    end
end
