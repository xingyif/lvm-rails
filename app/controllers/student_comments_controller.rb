class StudentCommentsController < ApplicationController
  before_action :set_student_comment, only: [:edit, :update, :destroy]

  def new
    @student_comment = StudentComment.new
    @student = Student.of(current_user).find(params[:student])
  end

  def create
    @student_comment = StudentComment.new(student_comment_params)

    if @student_comment.save
      redirect_to student_path(student_comment_params[:student_id])
    else
      @student = Student.of(current_user)
                        .find(student_comment_params[:student_id])
      render :new
    end
  end

  def edit
    @student = Student.of(current_user).find(@student_comment.student_id)
  end

  def update
    if @student_comment.update(student_comment_params)
      redirect_to student_path(student_comment_params[:student_id])
    else
      @student = Student.of(current_user)
                        .find(student_comment_params[:student_id])
      render :edit
    end
  end

  def destroy
    @student = Student.of(current_user).find(@student_comment.student_id)
    @student_comment.destroy

    redirect_to student_path(@student)
  end

  private

  def student_comment_params
    params.require(:student_comment).permit(
      :content,
      :student_id
    )
  end

  def set_student_comment
    @student_comment = StudentComment.find(params[:id])
  end
end
