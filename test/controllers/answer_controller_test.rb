require 'test_helper'

class AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get answer_new_url
    assert_response :success
  end

  test "should get create" do
    get answer_create_url
    assert_response :success
  end

  test "should get index" do
    get answer_index_url
    assert_response :success
  end

end
