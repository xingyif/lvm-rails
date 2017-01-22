class AddDatesToVolunteerJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteer_jobs, :start, :date
    add_column :volunteer_jobs, :end, :date
  end
end
