class ContactMailer < ApplicationMailer
  layout 'mailer'
  def contact_mail(params)
    @message = params[:message]
    mail(
      to: 'hello@3antworten.de',
      from: params[:email],
      subject: "Contact request from #{params[:from]}"
    )
  end
end
