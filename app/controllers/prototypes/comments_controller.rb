class Prototypes::CommentsController < ApplicationController
  before_action :set_prototype, only: :create

  def create
    @prototype.comments.create(comment_params)
    respond_to do |format|
      format.js
    end
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:comment][:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(
      :user_id,
      :content
    )
  end
end
