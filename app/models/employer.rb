class Employer < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :timeoutable

  has_many :posted_jobs, :class_name => "::Job", :dependent => :destroy

end
