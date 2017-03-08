class RemoveAffiliatEventsFromTutor < ActiveRecord::Migration[5.0]
  def change
    remove_column :tutors, :affiliate_event_participation
    remove_column :tutors, :affiliate_date_of_event
  end
end
