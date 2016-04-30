class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.eager_load(:user, :main_image)
                           .order(created_at: :DESC)
                           .page(params[:page])
    @type = 'newest'
  end
end
