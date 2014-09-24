class Admin < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :timeoutable, :authentication_keys => [:username]

end
