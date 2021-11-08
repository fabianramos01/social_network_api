require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url, as: :json
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { comments_count: @post.comments_count, content: @post.content, dislikes_count: @post.dislikes_count, likes_count: @post.likes_count, title: @post.title, user_email: @post.user_email } }, as: :json
    end

    assert_response 201
  end

  test "should show post" do
    get post_url(@post), as: :json
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { comments_count: @post.comments_count, content: @post.content, dislikes_count: @post.dislikes_count, likes_count: @post.likes_count, title: @post.title, user_email: @post.user_email } }, as: :json
    assert_response 200
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post), as: :json
    end

    assert_response 204
  end
end
