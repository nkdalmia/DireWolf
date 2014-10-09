require 'test_helper'

class JobApplicationTest < ActiveSupport::TestCase

  test "initial value of job application status should always be pending" do
    #load File.dirname(__FILE__) + '/../../db/seeds.rb'
    load_seed_data
    job_application = get_new_job_application_object
    job_application.status_id = 2
    assert job_application.save!, "not able to create a job application"

    assert_equal job_application.status_id, 1, "status of newly created job appliction is not 1"
  end

  def get_new_job_application_object
    JobApplication.new(:job => jobs(:one), :user => users(:one), :status_id => 1)
  end

end
