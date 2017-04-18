class WelcomeController < ApplicationController
  add_breadcrumb 'Home'

  def index
    @tutor_id = current_user.tutor_id
    @is_tutor = current_user.tutor?
    @is_coordinator = current_user.role == 1
    @is_admin = current_user.role == 2
  end
end
