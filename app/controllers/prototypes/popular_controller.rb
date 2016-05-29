class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.eager_load(:user, :main_image)
                           .order(likes_count: :DESC)
                           .page(params[:page])
    @type = 'popular'
  end
end

