class PageController < ApplicationController

  # GET /page
  def show
    require 'fastimage'
    background_image_path = "#{Rails.root}/app/assets/images/hero-background.jpg"
    @background_image_size = FastImage.size(background_image_path)
  end
end
