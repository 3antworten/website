class ContactMailer < ApplicationMailer
  layout 'mailer'
  def contact_mail(contact)
    @contact = contact
    mail(
      to: 'hello@3antworten.de',
      from: @contact.email,
      subject: "Contact request from #{@contact.from}"
    )
  end
end
