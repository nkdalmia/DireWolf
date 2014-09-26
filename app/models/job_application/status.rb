class JobApplication::Status < ActiveRecord::Base
  validates :name, uniqueness: true
end