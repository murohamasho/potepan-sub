require 'test_helper'

class UsersActivationTest < ActionDispatch::IntegrationTest
  def setup
    @activated     = users(:michael)
    @non_activated = users(:jojo)
  end
  
  test "show only activated user" do
    log_in_as(@activated)
    get user_path(@activated)
    get user_path(@non_activated)
    assert_redirected_to root_url
  end
  
end
