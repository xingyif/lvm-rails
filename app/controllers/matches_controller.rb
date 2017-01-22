class MatchesController < ApplicationController
  def create
    @match = Match.new(create_match_params)
  end

  private

  def create_match_params
    params.require(:match).permit(
      :start,
      :student_id,
      :tutor_id
    )
  end
end
