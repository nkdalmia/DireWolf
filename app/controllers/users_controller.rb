class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, :only => [:show, :edit, :update, :job_applications]
  before_action :check_logged_in_user

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root, notice: 'You have successfully created a jobseeker account.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        sign_out(current_user)
        sign_in(@user, :bypass => true)
        format.html { redirect_to @user, notice: 'Profile successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def job_applications
    @job_applications = @user.job_applications    
  end

  private

  def check_logged_in_user
    unless (current_user == @user)
      redirect_to root_path
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation, :resume, :skill_list)
    end
end
