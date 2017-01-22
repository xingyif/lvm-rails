class TutorsController < ApplicationController
  def index
    @tutors = Tutor.all
  end

  def show
    @tutor = Tutor.find(params[:id])
    @coordinator = coordinator
    @students = students
  end

  def coordinator
    job = VolunteerJob.where(tutor_id: params[:id], end: nil).take
    job.nil? ? nil : Coordinator.find(job.coordinator_id)
  end

  def students
    match_params = { tutor_id: params[:id], end: nil }
    Match.where(match_params).to_a.map { |m| Student.find(m.student_id) }
  end

  def new
    @tutor = Tutor.new
  end

  def edit
    @tutor = Tutor.find(params[:id])
  end

  def create
    @tutor = Tutor.new(tutor_params)

    if @tutor.save
      redirect_to @tutor
    else
      render 'new'
    end
  end

  def update
    @tutor = Tutor.find(params[:id])

    if @tutor.update(tutor_params)
      redirect_to @tutor
    else
      render 'edit'
    end
  end

  def destroy
    @tutor = Tutor.find(params[:id])
    @tutor.destroy

    redirect_to tutors_path
  end

  private

  def tutor_params
    params.require(:tutor).permit(
      :name,
      :email
    )
  end
end
