class TagsController < ApplicationController
  def create
    @tag = Tag.create(create_tag_params)
    render json: @tag
  end

  private

  def create_tag_params
    params.require(:tag).permit(:name)
  end
end
