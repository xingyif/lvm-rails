# rubocop:disable ClassLength, MethodLength
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
    calculate_preferences(params)

    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])
    calculate_preferences(params)

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

  def calculate_preferences(params)
    times = params[:student][:availability]
    age = params[:student][:age_preference]
    transportation = params[:student][:transportation]

    params[:student][:availability] = PreferencesHelper.squash(times)
    params[:student][:age_preference] = PreferencesHelper.squash(age)
    params[:student][:transportation] = PreferencesHelper.squash(transportation)
  end

  def student_params
    params.require(:student).permit(
      :first_name,
      :last_name,
      :dob,
      :gender,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :mail_ok,
      :email,
      :email_ok,
      :cell_phone,
      :cell_ok,
      :cell_lvm_ok,
      :home_phone,
      :home_ok,
      :home_lvm_ok,
      :work_phone,
      :work_lvm_ok,
      :work_lvm_ok,
      :alternate_number,
      :emergency_name,
      :emergency_number,
      :referral,
      :why_lvm,
      :race,
      :is_hispanic,
      :native_language,
      :origin_country,
      :availability,
      :smartt_id,
      :affiliate,
      :status,
      :status_date_of_change,
      :status_changed_by,
      :last_name_id,
      :preferred_contact,
      :immigrant_status,
      :education,
      :services_requested,
      :additional_services_requested,
      :criminal_conviction,
      :release_on_file,
      :release_sign_date,
      :cdbg_required,
      :cdbg_us_citizen,
      :cdbg_legal_resident,
      :cdbg_female_head_of_household,
      :cdbg_household_size,
      :cdbg_household_income
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
