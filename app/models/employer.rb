class Employer < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :timeoutable

  has_many :posted_jobs, :class_name => "::Job", :dependent => :destroy

  validates_presence_of :company_name, :contact_name
  validates :email, presence: true, uniqueness: true

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password

end
