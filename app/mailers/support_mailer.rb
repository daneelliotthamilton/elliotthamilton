class SupportMailer < ApplicationMailer

  def send_feedback(feedback)
    @feedback = feedback
    mail(to: "contact@elliotthamilton.com", reply_to: @feedback.email, subject: "Website Request: #{@feedback.subject}")
  end
end
