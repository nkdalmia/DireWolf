class JobApplication < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  belongs_to :status, :class_name => "JobApplication::Status"

  validates_presence_of :job_id, :user_id

  before_create :set_default_status

  def set_default_status
    self.status_id = ::JobApplication::Status.where(:name => 'Pending').first.id
  end

end
