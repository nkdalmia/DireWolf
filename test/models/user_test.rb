require 'test_helper'
#comment
class UserTest < ActiveSupport::TestCase

  test "cannot create user without email" do
    user = get_new_user_object
    user.email = nil
    assert_not user.save, "able to create a user without an email"
  end

  test "cannot create user without correct password confirmation" do
    user = get_new_user_object
    user.password_confirmation = "welcome123123"
    assert_not user.save, "able to create a user without the correct password confirmation"

    user.password_confirmation="welcome1"
    assert user.save!, "Unable to create a user even when password and its confirmation match"
  end

  def get_new_user_object
    User.new(:name => 'Test User', :email => 'testuser1@ncsu.edu', :password => 'welcome1', :password_confirmation => 'welcome1')
  end
end
