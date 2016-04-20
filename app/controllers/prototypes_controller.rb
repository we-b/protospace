class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :update, :destroy]
  before_action :set_new_comment, only: [:show, :update]

  def index
    @prototypes = Prototype.eager_load(:main_image, :user)
                           .page(params[:page])
    @type = 'random'
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
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
     end
  end

  def show
    @prototype = Prototype.eager_load(:comments, { comments: :user }).find(params[:id])
    @likes = @prototype.likes
  end

  def edit
    @main_image = @prototype.main_image
    @sub_images = @prototype.set_sub_thumbnails
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to ({ action: :show }), notice: 'Your prototype was successfully updated'
    else
      render ({ action: :edit }), alert: 'Your prototype was unsuccessfully updated'
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to :root, notice: "The prototype was successfully deleted"
    else
      render ({ action: :show }), alert: "The prototype was unsuccessfully deleted"
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def set_new_comment
    @comment = Comment.new
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:id, :content, :status]
    ).merge(tag_list: tag_params)
  end

  def tag_params
    params.require(:prototype).require(:tag_list)
  end
end
