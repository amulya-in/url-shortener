require 'test_helper'

# class UserTest < ActiveSupport::TestCase
#   test "credentials should be present" do
#   	user = User.new
#   	assert_not user.save
# 	end

# 	test "email must have correct format" do
#   	user = User.new(email: 'asfinfai', password: 'testing123')
#   	assert_not user.save
# 	end
# end

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_user_url
    assert_response :success
  end

end	
