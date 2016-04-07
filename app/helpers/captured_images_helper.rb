module CapturedImagesHelper
  def show_sub_thumnail(image)
    image = image.content.presence || asset_path('noimage.png')
  end
end
