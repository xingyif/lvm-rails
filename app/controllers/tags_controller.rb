class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
    @tagged_students = Tagging.where(tag_id: @tag.id, tutor_id: nil).map do |t|
      Student.find(t.student_id)
    end

    @tagged_tutors = Tagging.where(tag_id: @tag.id, student_id: nil).map do |t|
      Tutor.find(t.tutor_id)
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: 'Tag was successfully updated.'
    else
      redirect_to tags_path,
                  alert: 'Save failed. Another tag with the same name
                          already exists.'
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'Tag was successfully deleted.'
  end

  # rubocop:disable MethodLength
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      respond_to do |format|
        format.html { redirect_to(tags_path) }
        format.json { render json: @tag }
      end
    else
      redirect_to tags_path,
                  alert: 'Creation failed. Another tag with the same name
                          already exists.'
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
