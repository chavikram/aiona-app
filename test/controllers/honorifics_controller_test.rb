require 'test_helper'

class HonorificsControllerTest < ActionController::TestCase
  setup do
    @honorific = honorifics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:honorifics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create honorific" do
    assert_difference('Honorific.count') do
      post :create, honorific: { name: @honorific.name }
    end

    assert_redirected_to honorific_path(assigns(:honorific))
  end

  test "should show honorific" do
    get :show, id: @honorific
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @honorific
    assert_response :success
  end

  test "should update honorific" do
    patch :update, id: @honorific, honorific: { name: @honorific.name }
    assert_redirected_to honorific_path(assigns(:honorific))
  end

  test "should destroy honorific" do
    assert_difference('Honorific.count', -1) do
      delete :destroy, id: @honorific
    end

    assert_redirected_to honorifics_path
  end
end
