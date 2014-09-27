# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#JobApplication Status Values
::JobApplication::Status.create(:name => 'Pending')
::JobApplication::Status.create(:name => 'Not a Fit')
::JobApplication::Status.create(:name => 'Future Interview')

#Add Default Admin User
Admin.create(:name => 'Govind Menon', :username => 'gmenon', :email => 'gmenon@ncsu.edu', :password => 'welcome', :password_confirmation => 'welcome')

#Add Categories
Category.create(:name => 'Computer Science')
Category.create(:name => 'Botany')
Category.create(:name => 'Physics')
Category.create(:name => 'Mathematics')
Category.create(:name => 'Biology')
Category.create(:name => 'Chemistry')