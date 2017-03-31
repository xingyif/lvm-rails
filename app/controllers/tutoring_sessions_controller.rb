class TutoringSessionsController < ApplicationController
  before_action :set_tutoring_session, only: [:show, :edit, :update, :destroy]

  def index
    @tutoring_sessions = TutoringSession.all
  end

  def show; end

  def new
    @tutoring_session = TutoringSession.new
  end

  def edit; end

  def create
    @tutoring_session = TutoringSession.new(tutoring_session_params)

    if @tutoring_session.save
      redirect_to @tutoring_session,
                  notice: 'Tutoring session was successfully created.'
    else
      render :new
    end
  end

  def update
    if @tutoring_session.update(tutoring_session_params)
      redirect_to @tutoring_session,
                  notice: 'Tutoring session was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tutoring_session.destroy
    redirect_to tutoring_sessions_url,
                notice: 'Tutoring session was successfully destroyed.'
  end

  private

  def set_tutoring_session
    @tutoring_session = TutoringSession.find(params[:id])
  end

  def tutoring_session_params
    params.require(:tutoring_session).permit(:location, :hours,
                                             :start_date, :end_date,
                                             :session_comment)
  end
end
