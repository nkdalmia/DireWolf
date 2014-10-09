require 'test_helper'

class AdminTest < ActiveSupport::TestCase

  test "can create admin without email" do
    admin = get_new_admin_object
    admin.email = nil
    assert admin.save!, "not able to create an admin without an email"
  end

  test "cannot create admin without username" do
    admin = get_new_admin_object
    admin.username = nil
    assert_not admin.save, "able to create an admin without a username"
  end

  test "cannot create admin without correct password confirmation" do
    admin = get_new_admin_object
    admin.password_confirmation = "welcome123123"
    assert_not admin.save, "able to create an admin without the correct password confirmation"
  end

  def get_new_admin_object
    Admin.new(:name => 'Admin User', :username => 'admin', :email => 'admin@direwolf.com', :password => 'welcome', :password_confirmation => 'welcome')
  end

end
