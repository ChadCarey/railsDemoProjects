require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should post new" do
    post :new
    assert_response :success
  end

  test "should post create" do
    post :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
