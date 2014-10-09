require 'test_helper'

class EmployerTest < ActiveSupport::TestCase

  test "cannot create employer without correct password confirmation" do
    employer = get_new_employer_object
    employer.password_confirmation = "welcome123123"
    assert_not employer.save, "able to create an employer without the correct password confirmation"

    employer.password_confirmation="welcome"
    assert employer.save!, "Unable to create an employer even when password and its confirmation match"
  end

  test "cannot create employer without email" do
    employer = get_new_employer_object
    employer.email = nil
    assert_not employer.save, "able to create an employer without an email"
  end

  def get_new_employer_object
    Employer.new(:company_name => 'NCSU', :contact_name => 'Test Employer1', :email => 'employer1@ncsu.edu', :password => 'welcome', :password_confirmation => 'welcome',  )
  end
end
