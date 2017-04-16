class MatchesController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb 'Matches'

    @clickable_rows = false
    @page_title = 'Matches'
    @models = Match.of(current_user)
    @headers = [
      'Student First Name',
      'Student Last Name',
      'Tutor First Name',
      'Tutor Last Name',
      'Start Date',
      'End Date'
    ]
    @columns = [
      'student_first_name',
      'student_last_name',
      'tutor_first_name',
      'tutor_last_name',
      'start',
      'end'
    ]
  end
end
