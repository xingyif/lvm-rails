class VolunteerJobsController < ApplicationController
  def create
    @volunteer_job = VolunteerJob.new(create_volunteer_job_params)
  end

  private

  def create_volunteer_job_params
    params.require(:volunteer_job).permit(
      :coordinator_id,
      :start,
      :tutor_id
    )
  end
end
