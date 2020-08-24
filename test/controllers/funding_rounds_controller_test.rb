require 'test_helper'

class FundingRoundsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get funding_rounds_new_url
    assert_response :success
  end

  test "should get create" do
    get funding_rounds_create_url
    assert_response :success
  end

  test "should get index" do
    get funding_rounds_index_url
    assert_response :success
  end

  test "should get interested" do
    get funding_rounds_interested_url
    assert_response :success
  end

end
