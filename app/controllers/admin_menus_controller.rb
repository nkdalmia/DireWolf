class AdminMenusController < ApplicationController

  before_action :authenticate_admin!
  #test comment
  def index
  end
end
