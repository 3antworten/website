class ContactController < ApplicationController
  def create
    ContactMailer.contact_mail(params).deliver_now
    render nothing: true
  end
end
