class TutoringSessionsController < ApplicationController
  before_action :guard_against_tutors
  before_action :set_tutor_or_match, only: [:index, :new]
  before_action :set_tutoring_session, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb 'Tutoring Sessions'

    if @tutor
      @tutoring_sessions = TutoringSession.joins(:match).where(
        matches: { tutor_id: @tutor.id }
      )
    elsif @match
      @tutor = Tutor.of(current_user).find(@match.tutor_id)
      @student = Student.of(current_user).find(@match.student_id)
      @tutoring_sessions = TutoringSession.where(match_id: @match.id)
    end
  end

  def show
    add_breadcrumb 'Tutoring Sessions', tutoring_sessions_path
    add_breadcrumb 'Tutoring Session'
  end

  def new
    add_breadcrumb 'Tutoring Sessions', tutoring_sessions_path
    add_breadcrumb 'New Tutoring Session'

    if params[:student_id] && params[:tutor_id]
      @student = Student.find(params[:student_id])
      @current_match = Match.where(
        student_id: params[:student_id], tutor_id: params[:tutor_id], end: nil
      ).take
    end
    @students = Match.where(tutor_id: params[:tutor_id], end: nil)
                     .map { |m| [m.student.name, m.id] }
    @tutoring_session = TutoringSession.new
  end

  def edit
    add_breadcrumb 'Tutoring Sessions', tutoring_sessions_path
    add_breadcrumb 'Tutoring Session', tutoring_session_path(@tutoring_session)
    add_breadcrumb 'New Tutoring Session'

    tutor_id = Match.find(@tutoring_session.match_id).tutor_id
    @students = Match.where(tutor_id: tutor_id)
                     .map { |m| [m.student.name, m.id] }
  end

  def create
    @tutoring_session = TutoringSession.new(tutoring_session_params)

    if @tutoring_session.save
      redirect_to @tutoring_session,
                  notice: 'Tutoring session was successfully created.'
    else
      set_students_and_tutor
      render :new
    end
  end

  def update
    if @tutoring_session.update(tutoring_session_params)
      redirect_to @tutoring_session,
                  notice: 'Tutoring session was successfully updated.'
    else
      set_students_and_tutor
      render :edit
    end
  end

  def destroy
    @tutoring_session.destroy
    redirect_to tutoring_sessions_path(
      tutor_id: @tutor.id,
      notice: 'Tutoring session was successfully destroyed.'
    )
  end

  private

  def guard_against_tutors
    tutor_id = params[:tutor_id]
    is_tutor = current_user.tutor?
    kick_out if is_tutor && tutor_id && tutor_id.to_i != current_user.tutor_id
  end

  def set_tutoring_session
    @tutoring_session = TutoringSession.find(params[:id])
    match = Match.find(@tutoring_session.match_id)
    @tutor = Tutor.of(current_user).where(id: match.tutor_id).take
    @student = Student.of(current_user).where(id: match.student_id).take

    kick_out if !@tutor || !@student
  end

  def set_students_and_tutor
    @tutor = Tutor.of(current_user)
                  .find(params.to_unsafe_h['tutoring_session']['tutor_id'])
    @students = Match.where(tutor_id: @tutor.id)
                     .map { |m| [m.student.name, m.id] }
  end

  def set_tutor_or_match
    if current_user.tutor?
      @tutor = Tutor.find(current_user.tutor_id)
    elsif params[:tutor_id]
      @tutor = Tutor.of(current_user).where(id: params[:tutor_id]).take
    elsif params[:match_id]
      @match = Match.find(params[:match_id])
    end

    kick_out unless @tutor || @match
  end

  def tutoring_session_params
    params.require(:tutoring_session).permit(:end_date,
                                             :hours,
                                             :location,
                                             :session_comment,
                                             :start_date,
                                             :match_id)
  end

  def kick_out
    flash[:alert] = 'Something went wrong!'
    redirect_to root_path
  end
end
