require 'test_helper'

class ElectionNominationsControllerTest < ActionController::TestCase
  setup do
    @election_nomination = election_nominations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:election_nominations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create election_nomination" do
    assert_difference('ElectionNomination.count') do
      post :create, election_nomination: { active: @election_nomination.active, deleted: @election_nomination.deleted, election_id: @election_nomination.election_id, form_issue_date: @election_nomination.form_issue_date, offline_filing_end_date: @election_nomination.offline_filing_end_date, offline_filing_extended_days: @election_nomination.offline_filing_extended_days, offline_filing_start_date: @election_nomination.offline_filing_start_date, online_filing_end_date: @election_nomination.online_filing_end_date, online_filing_extended_time: @election_nomination.online_filing_extended_time, online_filing_start_date: @election_nomination.online_filing_start_date, result_datetime: @election_nomination.result_datetime, sort_order: @election_nomination.sort_order, start_date: @election_nomination.start_date }
    end

    assert_redirected_to election_nomination_path(assigns(:election_nomination))
  end

  test "should show election_nomination" do
    get :show, id: @election_nomination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @election_nomination
    assert_response :success
  end

  test "should update election_nomination" do
    patch :update, id: @election_nomination, election_nomination: { active: @election_nomination.active, deleted: @election_nomination.deleted, election_id: @election_nomination.election_id, form_issue_date: @election_nomination.form_issue_date, offline_filing_end_date: @election_nomination.offline_filing_end_date, offline_filing_extended_days: @election_nomination.offline_filing_extended_days, offline_filing_start_date: @election_nomination.offline_filing_start_date, online_filing_end_date: @election_nomination.online_filing_end_date, online_filing_extended_time: @election_nomination.online_filing_extended_time, online_filing_start_date: @election_nomination.online_filing_start_date, result_datetime: @election_nomination.result_datetime, sort_order: @election_nomination.sort_order, start_date: @election_nomination.start_date }
    assert_redirected_to election_nomination_path(assigns(:election_nomination))
  end

  test "should destroy election_nomination" do
    assert_difference('ElectionNomination.count', -1) do
      delete :destroy, id: @election_nomination
    end

    assert_redirected_to election_nominations_path
  end
end
