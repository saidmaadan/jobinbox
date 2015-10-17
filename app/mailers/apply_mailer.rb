class ApplyMailer < ApplicationMailer
  def apply_created(current_candidate, job_employer, name, email, phone, message, resume)

    @current_candidate = current_candidate
    @job_employer = job_employer
    @name = name
    @email = email
    @phone = phone
    @message = message
    @resume = resume

    mail(to: job_employer.email_address,
      from: "hr@job-inbox.com",
      subject: "Application Submitted",
    )
  end
end