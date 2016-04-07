class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to new_prototype_url, alert: 'New prototype was unsuccessfully created'
      # //////
      # redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
      # //////
      # flash[:alert] = 'New prototype was unsuccessfully created'
      # redirect_to action: :new
     end
  end

  def show
  end

  def destroy
    if @prototype.destroy
      redirect_to :root, notice: "The prototype was successfully deleted"
    else
      render action: :show, alert: "The prototype was unsuccessfully deleted"
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]
    )
  end
end
