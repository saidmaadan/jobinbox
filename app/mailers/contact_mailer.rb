class ContactMailer < ActionMailer::Base
  default to: 'said@maadan.me'

  def contact_email(name, email, subject, body)
    @name = name
    @email = email
    @subject = subject
    @body = body

    mail(from: email, subject: 'Contact form Message')
  end

end