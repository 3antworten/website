class ContactController < ApplicationController
  before_action :set_contact

  def create
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver_now
      render status: :ok, json: {
        errors: [],
        entity: 'contact'
      }
    else
      render status: :unprocessable_entity, json: {
        errors: @contact.errors,
        entity: 'contact'
      }
    end
  end

  private

  def set_contact
    @contact = Contact.new(contact_params)
  end

  def contact_params
    params.require(:contact).permit(:from, :email, :message)
  end
end
