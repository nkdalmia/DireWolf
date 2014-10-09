class JobApplicationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :destroy, :create]
  before_action :set_job_application, only: [:show, :update, :destroy]

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show
    if current_employer && current_employer.posted_jobs.where(:id => @job_application.job_id)
      @user = @job_application.user
      render 'show'
    else
      redirect_to root_url
    end
  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
    @job = Job.find(params[:job_id])
    redirect_to @job if current_user.applied_for(@job)
  end

  # POST /job_applications
  # POST /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)

    respond_to do |format|
      if @job_application.save
        notify_employer
        format.html { redirect_to user_applications_path(:id => @job_application.user_id), notice: 'Job application was successfully submitted.' }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        notify_status_change_to_user
        format.html { redirect_to @job_application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    if current_user.job_applications.where(:id => @job_application).first
      @job_application.destroy
      respond_to do |format|
        format.html { redirect_to user_applications_path(:id => current_user.id), notice: 'Job application was successfully withdrawn.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_application_params
      params.require(:job_application).permit(:job_id, :user_id, :cover_letter, :status_id)
    end

  def notify_employer
    SimpleMailer.send_email(@job_application.job.employer.email, 'New Job Application Received',
                            "#{@job_application.user.name} has applied for the job position \"#{@job_application.job.title}\"").deliver
  end


  def notify_status_change_to_user
    if (params['job_application']['old_status_id'] != @job_application.status_id.to_s())
      message = "The status of your job application for the position of \"#{@job_application.job.title}\" at \"#{@job_application.job.employer.company_name}\" has been changed to \"#{@job_application.status.name}\""
      SimpleMailer.send_email(@job_application.user.email, 'Your Job Application Status has Changed', message).deliver
    end
  end

end
