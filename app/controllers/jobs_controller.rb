class JobsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  autocomplete :company, :name
  

  def new
    @job = current_user.profile.jobs.new
    redirect_to(@job)
  end

  def create
    @job = current_user.profile.jobs.new(job_params)
    @job.save
    redirect_to profile_path(current_user.profile)
  end

  def destroy
    @job = current_user.profile.jobs.where(id: params[:id])
    @job.destroy if @job
    redirect_to profile_path(current_user.profile)
  end

  private

   def job_params
      params.require(:job).permit(:title_id, :company_name, :description, :currently_work)
   end

end