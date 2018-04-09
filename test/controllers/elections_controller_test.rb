require 'test_helper'

class ElectionsControllerTest < ActionController::TestCase
  setup do
    @election = elections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:elections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create election" do
    assert_difference('Election.count') do
      post :create, election: { deleted: @election.deleted, election_date: @election.election_date, election_end_time: @election.election_end_time, election_start_time: @election.election_start_time, election_type_id: @election.election_type_id, extended_time: @election.extended_time, name: @election.name, sort_order: @election.sort_order }
    end

    assert_redirected_to election_path(assigns(:election))
  end

  test "should show election" do
    get :show, id: @election
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @election
    assert_response :success
  end

  test "should update election" do
    patch :update, id: @election, election: { deleted: @election.deleted, election_date: @election.election_date, election_end_time: @election.election_end_time, election_start_time: @election.election_start_time, election_type_id: @election.election_type_id, extended_time: @election.extended_time, name: @election.name, sort_order: @election.sort_order }
    assert_redirected_to election_path(assigns(:election))
  end

  test "should destroy election" do
    assert_difference('Election.count', -1) do
      delete :destroy, id: @election
    end

    assert_redirected_to elections_path
  end
end
