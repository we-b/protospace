class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.eager_load(:user, :main_image).order(created_at: :DESC)
    @type = 'newest'
    render template: 'prototypes/index'
  end
end
