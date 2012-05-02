require 'test_helper'

class TagControllerTest < ActionController::TestCase
  test "should get questions" do
    get :questions
    assert_response :success
  end

end
