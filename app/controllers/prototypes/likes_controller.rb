class Prototypes::LikesController < ApplicationController
  before_action :set_prototype, only: [:create, :destroy]

  def create
    @prototype.likes.create(params.permit(:user_id))
  end

  def destroy
    @prototype.likes.find(params[:id]).destroy
    @prototype.reload
  end

  private

  def set_prototype
    @prototype = Prototype.eager_load(:comments, { comments: :user }).find(params[:prototype_id])
  end
end
