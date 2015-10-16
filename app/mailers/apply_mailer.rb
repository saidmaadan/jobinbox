class ApplyMailer < ApplicationMailer::Base
  def apply_created(current_candidate, job_employer, message, resume)

    @current_candidate = current_candidate
    @job_employer = job_employer
    @message = message
    @resume = resume

    mail(to: job_employer.email_address,
      from: "hr@job-inbox.com",
      subject: "Application Submitted",
    )
  end
end