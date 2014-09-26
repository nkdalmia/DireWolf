class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_taggable_on :skills
  has_many :job_applications

  def applied_for(job_id)
    return true if self.job_applications.where(:job_id => job_id).first
    return false
  end

  def application_for(job_id)
    self.job_applications.where(:job_id => job_id).first
  end

end
