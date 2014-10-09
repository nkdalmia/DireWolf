require 'test_helper'

class JobTest < ActiveSupport::TestCase

  test "can not create job without title" do
    job = get_new_job_object
    job.title = nil
    assert_not job.save, "able to create a job without a title"

    assert get_new_job_object.save!, "not able to create a job"
  end

  def get_new_job_object
    Job.new(:title => 'Test Job', :employer => employers(:one), :category => categories(:one), :deadline => Date.new + 1)
  end

end
