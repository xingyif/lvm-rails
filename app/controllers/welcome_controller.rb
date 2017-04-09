class WelcomeController < ApplicationController
  def index
    @see_students = current_user.role > 0
    @see_tutors = current_user.role > 0
    @see_matches = current_user.role > 0
    @see_coordinators = current_user.role == 2
    @see_affiliates = current_user.role == 2
  end
end
