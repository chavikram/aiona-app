require 'test_helper'

class ElectionPostsControllerTest < ActionController::TestCase
  setup do
    @election_post = election_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:election_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create election_post" do
    assert_difference('ElectionPost.count') do
      post :create, election_post: { deleted: @election_post.deleted, election_id: @election_post.election_id, no_of_post: @election_post.no_of_post, post_id: @election_post.post_id, sort_order: @election_post.sort_order }
    end

    assert_redirected_to election_post_path(assigns(:election_post))
  end

  test "should show election_post" do
    get :show, id: @election_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @election_post
    assert_response :success
  end

  test "should update election_post" do
    patch :update, id: @election_post, election_post: { deleted: @election_post.deleted, election_id: @election_post.election_id, no_of_post: @election_post.no_of_post, post_id: @election_post.post_id, sort_order: @election_post.sort_order }
    assert_redirected_to election_post_path(assigns(:election_post))
  end

  test "should destroy election_post" do
    assert_difference('ElectionPost.count', -1) do
      delete :destroy, id: @election_post
    end

    assert_redirected_to election_posts_path
  end
end
