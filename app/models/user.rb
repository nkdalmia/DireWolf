class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_taggable_on :skills
  has_many :job_applications

  validates_presence_of :name
  validates :email, uniqueness: true

  def applied_for(job_id)
    return true if self.job_applications.where(:job_id => job_id).first
    return false
  end

  def application_for(job_id)
    self.job_applications.where(:job_id => job_id).first
  end

  def recommended_jobs
    job_tags = self.job_applications.joins{job.tags}.pluck("tags.name").uniq
    recommended_jobs = []
    Job.all.each do |job|
      if (job.tag_list & job_tags).count > 0
        recommended_jobs.push(job) unless self.applied_for(job.id)
      end
    end
    return recommended_jobs
  end

end
