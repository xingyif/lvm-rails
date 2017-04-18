class WelcomeController < ApplicationController
  add_breadcrumb 'Home'

  def index
    @see_tutoring_sessions = current_user.tutor?
    @tutor_id = current_user.tutor_id
    @see_students = current_user.role > 0
    @see_tutors = current_user.role > 0
    @see_matches = current_user.role > 0
    @see_coordinators = current_user.role == 2
    @see_affiliates = current_user.role == 2
    @see_deleted_students = current_user.role == 2
    @see_deleted_tutors = current_user.role == 2
  end
end
