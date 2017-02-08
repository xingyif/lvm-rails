class StudentsController < ApplicationController
  helper_method :tutor_options

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @match = current_match(params[:id])
    @enrollment = current_enrollment(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  def set_tutor
    tutor_id = params[:tutor_id].to_i
    student_id = params[:student_id].to_i
    if should_update_tutor(student_id, tutor_id)
      unmatch_current_tutor(student_id)
      start_match_with_tutor(student_id, tutor_id) if tutor_id != 0
    end
    redirect_to Student.find(student_id)
  end

  private

  def student_params
    params.require(:student).permit(
      :name
    )
  end

  def tutor_options
    tutors = Tutor.all.to_a.map { |t| [t.name, t.id] }
    tutors.insert(0, ['No Tutor', 0])
  end

  def should_update_tutor(student_id, tutor_id)
    # If the selection was "No tutor" (id is 0)
    # or the student doesn't have a tutor
    # or the student does have one and this tutor isn't it
    tutor_id.zero? ||
      !current_match(student_id) ||
      (tutor_id != 0 && tutor_is_existing_tutor(student_id, tutor_id))
  end

  def tutor_is_existing_tutor(student_id, tutor_id)
    current_tutor = current_match(student_id)
    current_tutor && tutor_id != current_tutor.tutor_id
  end

  def unmatch_current_tutor(student_id)
    Match.where(student_id: student_id, end: nil).update_all(end: Date.today)
  end

  def start_match_with_tutor(student_id, tutor_id)
    Match.create(student_id: student_id, tutor_id: tutor_id, start: Date.today)
  end

  def current_match(student_id)
    Match.where(student_id: student_id, end: nil).take
  end

  def current_enrollment(student_id)
    Enrollment.where(student_id: student_id, end: nil).take
  end
end
