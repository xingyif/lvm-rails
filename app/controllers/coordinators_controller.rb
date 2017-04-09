class CoordinatorsController < ApplicationController
  before_action :ensure_admin!
  before_action :set_coordinator, only: [:show, :edit, :update, :destroy]

  def index
    @coordinators = Coordinator.all
  end

  def show
    @students = students
    @tutors = tutors
  end

  def new
    @coordinator = Coordinator.new
  end

  def edit; end

  def create
    @coordinator = Coordinator.new(coordinator_params)

    if @coordinator.save
      redirect_to @coordinator
    else
      render 'new'
    end
  end

  def update
    if @coordinator.update(coordinator_params)
      redirect_to @coordinator
    else
      render 'edit'
    end
  end

  def destroy
    @coordinator.destroy

    redirect_to coordinators_path
  end

  private

  def set_coordinator
    @coordinator = Coordinator.find(params[:id])
  end

  def coordinator_params
    params.require(:coordinator).permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :date_of_birth
    )
  end

  def students
    match_params =
      { affiliate_id: @coordinator.affiliate_id, end: nil }
    Enrollment.where(match_params).to_a.map { |e| Student.find(e.student_id) }
  end

  def tutors
    match_params =
      { affiliate_id: @coordinator.affiliate_id, end: nil }
    VolunteerJob.where(match_params).to_a.map { |v| Tutor.find(v.tutor_id) }
  end
end
