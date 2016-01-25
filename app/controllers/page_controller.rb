class PageController < ApplicationController
  before_action :set_contact

  # GET /page
  def show
    require 'date'
    require 'fastimage'

    @current_year = Date.today.strftime("%Y")
    background_image_path = "#{Rails.root}/app/assets/images/hero-background.jpg"
    @background_image_size = FastImage.size(background_image_path)
  end

  private

  def set_contact
    @contact = Contact.new(message: I18n.t('contact.default-message'))
  end
end
