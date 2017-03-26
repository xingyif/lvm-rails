class CoordinatorsController < ApplicationController
  def index
    @coordinators = Coordinator.all
  end

  def show
    @coordinator = Coordinator.find(params[:id])
    @students = students
    @tutors = tutors
  end

  def new
    @coordinator = Coordinator.new
  end

  def edit
    @coordinator = Coordinator.find(params[:id])
  end

  def create
    @coordinator = Coordinator.new(coordinator_params)

    if @coordinator.save
      redirect_to @coordinator
    else
      render 'new'
    end
  end

  def update
    @coordinator = Coordinator.find(params[:id])

    if @coordinator.update(coordinator_params)
      redirect_to @coordinator
    else
      render 'edit'
    end
  end

  def destroy
    @coordinator = Coordinator.find(params[:id])
    @coordinator.destroy

    redirect_to coordinators_path
  end

  private

  def coordinator_params
    params.require(:coordinator).permit(
      :name,
      :email,
      :phone_number,
      :date_of_birth
    )
  end

  def students
    match_params = { coordinator_id: params[:id], end: nil }
    Enrollment.where(match_params).to_a.map { |e| Student.find(e.student_id) }
  end

  def tutors
    match_params = { coordinator_id: params[:id], end: nil }
    VolunteerJob.where(match_params).to_a.map { |v| Tutor.find(v.tutor_id) }
  end
end
