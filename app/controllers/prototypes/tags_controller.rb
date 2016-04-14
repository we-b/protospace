class Prototypes::TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used.where('taggings_count > 0')
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:tag_name])
    @prototypes = Prototype.tagged_with(@tag).eager_load(:main_image, :user).order(likes_count: :desc)
  end
end
