class Employer < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :timeoutable

end
