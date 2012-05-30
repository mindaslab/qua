require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get questions" do
    get :questions
    assert_response :success
  end

  test "should get answers" do
    get :answers
    assert_response :success
  end

  test "should get tags" do
    get :tags
    assert_response :success
  end

end
