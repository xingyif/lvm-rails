class CreateVolunteerJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteer_jobs do |t|
      t.belongs_to :tutor, index: true
      t.belongs_to :coordinator, index: true

      t.timestamps
    end
  end
end
