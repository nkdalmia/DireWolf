class Admin < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :timeoutable, :authentication_keys => [:username]

  validates_presence_of :name
  validates :username, presence: true, uniqueness: true

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password

end
