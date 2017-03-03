# rubocop:disable ClassLength
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

  # rubocop:disable MethodLength
  def create
    calculate_preferences(params)
    clean_params = tutor_params.clone
    clean_params['language_proficiencies'] =
      params.to_unsafe_h['language_proficiencies'] ||
      params['tutor']['language_proficiencies']
    @tutor = Tutor.new(clean_params)

    if @tutor.save
      redirect_to @tutor
    else
      render 'new'
    end
  end

  def update
    @tutor = Tutor.find(params[:id])

    calculate_preferences(params)
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

  def calculate_preferences(params)
    times = params[:tutor][:availability]
    age = params[:tutor][:age_preference]
    category = params[:tutor][:category_preference]

    params[:tutor][:availability] = PreferencesHelper.squash(times)
    params[:tutor][:age_preference] = PreferencesHelper.squash(age)
    params[:tutor][:category_preference] = PreferencesHelper.squash(category)
  end

  def tutor_params
    params.require(:tutor).permit(
      :address1,
      :address2,
      :affiliate_date_of_event,
      :affiliate_event_participation,
      :affiliate,
      :age_preference,
      :availability,
      :category_preference,
      :cell_phone,
      :city,
      :colleges_attended,
      :country_leave_date,
      :country_of_birth,
      :country_return_date,
      :criminal_conviction,
      :date_of_birth,
      :education,
      :educational_accomplishments,
      :email_other,
      :email_preferred,
      :emergency_contact_email,
      :emergency_contact_name,
      :emergency_contact_phone,
      :employer_name,
      :employment_status,
      :first_name,
      :gender,
      :hispanic_or_latino,
      :hobbies,
      :home_phone,
      :intake_date,
      :language_proficiencies,
      :last_name_id,
      :last_name,
      :native_language,
      :occupation,
      :orientation_date,
      :other_phone,
      :past_occupation,
      :preferred_contact_class_listing,
      :preferred_contact_data_collection,
      :preferred_contact_method,
      :previous_teaching_experience,
      :previous_volunteer_experience,
      :race,
      :reference,
      :referral,
      :referral_other,
      :release_on_file,
      :release_sign_date,
      :smartt_id,
      :state,
      :status_changed_by,
      :status_date_of_change,
      :status,
      :teachable_subjects,
      :training_date,
      :training_type,
      :training,
      :zip
    )
  end
end
