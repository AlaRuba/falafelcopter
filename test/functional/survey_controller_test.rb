require 'test_helper'

class SurveyControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get next" do
    get :next
    assert_response :success
  end

  test "should get limit" do
    get :limit
    assert_response :success
  end

end
