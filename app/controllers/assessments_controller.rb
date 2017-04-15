class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'Home', :root_path

  # GET /assessments
  def index
    add_breadcrumb 'Assessments'

    @assessments = Assessment.all
  end

  # GET /assessments/1
  def show
    add_breadcrumb 'Assessments', assessments_path
    add_breadcrumb 'Assessment'
  end

  # GET /assessments/new
  def new
    add_breadcrumb 'Assessments', assessments_path
    add_breadcrumb 'New Assessment'

    @assessment = Assessment.new
  end

  # GET /assessments/1/edit
  def edit
    add_breadcrumb 'Assessments', assessments_path
    add_breadcrumb 'Assessment', assessment_path(@assessment)
    add_breadcrumb 'Edit'
  end

  # POST /assessments
  def create
    @assessment = Assessment.new(assessment_params)

    if @assessment.save
      redirect_to @assessment, notice: 'Assessment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /assessments/1
  def update
    if @assessment.update(assessment_params)
      redirect_to @assessment, notice: 'Assessment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /assessments/1
  def destroy
    @assessment.destroy
    redirect_to assessments_url, notice: 'Assessment was successfully deleted.'
  end

  private

  def set_assessment
    @assessment = Assessment.find(params[:id])
  end

  def assessment_params
    params.require(:assessment).permit(:score, :date, :category,
                                       :level, :name, :assessment_type,
                                       :student_id)
  end
end
