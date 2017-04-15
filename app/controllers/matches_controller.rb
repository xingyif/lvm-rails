class MatchesController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb 'Matches'

    if current_user.admin?
      @matches = Match.all
    elsif current_user.coordinator?
      @matches = Match.where(
        affiliate_id: Coordinator.find(
          current_user.coordinator_id
        ).affiliate_id
      )
    end
  end
end
