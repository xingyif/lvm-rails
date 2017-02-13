class TutorsController < ApplicationController
  helper_method :student_options

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

  def student_options
    matched_student_ids = Match.where(end: nil).to_a.map(&:student_id)
    all_students_arr = Student.all.to_a
    untutored_students = all_students_arr
                         .reject { |s| matched_student_ids.include? s.id }
    untutored_students.map { |t| [t.name, t.id] }
  end

  def add_student
    student_id = params[:student_id]
    tutor_id = params[:tutor_id]
    Match.create(student_id: student_id, tutor_id: tutor_id, start: Date.today)
    redirect_to Tutor.find(tutor_id)
  end

  private

  # rubocop:disable MethodLength
  def tutor_params
    params.require(:tutor).permit(
      :address,
      :affiliate,
      :cell_phone,
      :city,
      :dob,
      :education,
      :email,
      :employment,
      :first_name,
      :gender,
      :last_name,
      :native_language,
      :occupation,
      :orientation,
      :phone,
      :race,
      :referral,
      :state,
      :training_type,
      :training,
      :zip
    )
  end
end
